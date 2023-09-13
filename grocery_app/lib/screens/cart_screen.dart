import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_view.dart';
import '../consts/dummy_data.dart';
import '../widgets/empty_view.dart';
import '../widgets/tile_between.dart';

double _percentTax = 1;
double _delivery = 4.99;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var menus = DummyData().getMenus;
  var sales = DummyData().getSales;
  bool isEmpty = false;
  double cartTotal = 0;
  double tax = 0;

  void updatePrice() {
    var total = 0.0;
    for (var element in menus) {
      var price = double.parse(element["price"]);
      var number = double.parse(element["number"]);

      total += price * number;
    }
    // round 2
    total = double.parse(total.toStringAsFixed(2));
    print(total);

    setState(() {
      // update tax & total
      cartTotal = total;
      tax = total * _percentTax / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    updatePrice();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Food Cart'),
      ),
      body: isEmpty
          ? const EmptyView(
              icon: 'assets/images/another/cart.png',
              text: 'Your Cart is empty,\nplease come back and shopping more!')
          : Column(
              children: [
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: menus.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CartView(
                        id: menus[index]["id"],
                        title: menus[index]["title"],
                        description: menus[index]["subTitle"],
                        icon: menus[index]["icon"],
                        number: int.parse(menus[index]["number"]),
                        price: menus[index]["price"],
                        updateNumberic: (newNumber) {
                          menus[index]["number"] = newNumber.toString();
                          updatePrice();
                        },
                        removeItem: (String id) {
                          setState(() {
                            menus.removeWhere((element) => element['id'] == id);
                          });
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 10, 18, 5),
                      child: Column(
                        children: [
                          TileBetweenView(
                              title: 'Cart total', description: '\$$cartTotal'),
                          TileBetweenView(
                              title: 'Tax',
                              description: '\$${tax.toStringAsFixed(2)}'),
                          TileBetweenView(
                              title: 'Delivery', description: '\$$_delivery'),
                          TileBetweenView(
                              title: 'Promp discount', description: '\$0.00'),
                          const Divider(
                            color: Colors.grey,
                          ),
                          TileBetweenView(
                              title: 'Subtotal',
                              description:
                                  '\$${(cartTotal + tax + _delivery).toStringAsFixed(2)}',
                              sizeDescription: 25),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 25),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                    backgroundColor:
                                        Theme.of(context).primaryColorDark,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)))),
                                onPressed: () {},
                                child: const Text(
                                  'Payment',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
    );
  }
}
