import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_view.dart';
import '../widgets/empty_view.dart';
import '../widgets/tile_between.dart';

List<Map<String, dynamic>> _menus = [
  {
    "id": "1",
    "title": "Nutritional cereals",
    "description": "whole grains",
    "price": "110.4",
    "icon": "assets/images/cat/nuts.png",
    "number": "1",
  },
  {
    "id": "2",
    "title": "Dried fruit",
    "description": "clean fruit",
    "price": "8.4",
    "icon": "assets/images/cat/fruits.png",
    "number": "1",
  },
  {
    "id": "3",
    "title": "Grains and cereals",
    "description": "whole grains",
    "price": "19.2",
    "icon": "assets/images/cat/grains.png",
    "number": "1",
  },
  {
    "id": "4",
    "title": "Spices",
    "description": "Spices and condiments",
    "price": "50",
    "icon": "assets/images/cat/spices.png",
    "number": "1",
  },
  {
    "id": "5",
    "title": "Spinach",
    "description": "spinach leaves",
    "price": "20.8",
    "icon": "assets/images/cat/Spinach.png",
    "number": "1",
  },
  {
    "id": "6",
    "title": "Vegetable",
    "description": "clean vegetables",
    "price": "45.2",
    "icon": "assets/images/cat/veg.png",
    "number": "1",
  },
];
double _percentTax = 1;
double _delivery = 4.99;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEmpty = false;
  double cartTotal = 0;
  double tax = 0;

  void updatePrice() {
    var total = 0.0;
    for (var element in _menus) {
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
                    itemCount: _menus.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CartView(
                        id: _menus[index]["id"],
                        title: _menus[index]["title"],
                        description: _menus[index]["description"],
                        icon: _menus[index]["icon"],
                        number: int.parse(_menus[index]["number"]),
                        price: _menus[index]["price"],
                        updateNumberic: (newNumber) {
                          _menus[index]["number"] = newNumber.toString();
                          updatePrice();
                        },
                        removeItem: (String id) {
                          setState(() {
                            _menus
                                .removeWhere((element) => element['id'] == id);
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
