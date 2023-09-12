import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/numberic_view.dart';
import 'package:grocery_app/widgets/text_color_view.dart';
import 'package:grocery_app/widgets/text_icon_card_view.dart';

import '../consts/utils.dart';

class ItemDetailView extends StatefulWidget {
  static const routeName = "/ItemDetailView";
  ItemDetailView(
      {super.key,
      required this.title,
      required this.description,
      required this.number,
      required this.icon,
      required this.price});

  final String title;
  final String description;
  int number;
  final String icon;
  final double price;

  @override
  State<ItemDetailView> createState() => _ItemDetailViewState();
}

class _ItemDetailViewState extends State<ItemDetailView> {
  double totalPrice = 0;

  void updateTotal(int newNumber) {
    setState(() {
      widget.number = newNumber;
      totalPrice = newNumber * widget.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    updateTotal(widget.number);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: () => Navigator.pop(context),
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              tooltip: 'Your cart',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is your cart')));
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(widget.icon),
                )),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  TextColorView(
                                      text: '245 kcal', color: Colors.green),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextColorView(
                                      text: '4.5 star', color: Colors.yellow),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextColorView(
                                      text: '45 min', color: Colors.blue),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton.filled(
                        onPressed: () {},
                        icon: const Icon(
                          IconlyBold.heart,
                          color: Colors.white,
                          size: 15,
                        ),
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Details',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      widget.description,
                                      softWrap: true,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 100,
                          child: GridView.count(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            crossAxisCount: 1,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            mainAxisSpacing: 20,
                            children: const [
                              TextIconCard(
                                  icon: Icons.pedal_bike, text: '30 min'),
                              TextIconCard(
                                  icon: Icons.polyline_sharp, text: '3.6 km'),
                              TextIconCard(
                                  icon: Icons.map_outlined, text: 'Map view'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NumbericView(
                            number: widget.number,
                            callback: updateTotal,
                            axis: Axis.horizontal),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: const Size.fromHeight(65),
                                backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)))),
                            onPressed: () {},
                            child: Text(
                              'Order for \$${totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
