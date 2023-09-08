import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_view.dart';

import '../widgets/empty_view.dart';

List<Map<String, dynamic>> _menus = [
  {
    "title": "Nutritional cereals",
    "description": "whole grains",
    "price": "110.4",
    "icon": "assets/images/cat/nuts.png",
    "number": "1",
  },
  {
    "title": "Dried fruit",
    "description": "clean fruit",
    "price": "8.4",
    "icon": "assets/images/cat/fruits.png",
    "number": "1",
  },
  {
    "title": "Grains and cereals",
    "description": "whole grains",
    "price": "19.2",
    "icon": "assets/images/cat/grains.png",
    "number": "1",
  },
  {
    "title": "Spices",
    "description": "Spices and condiments",
    "price": "50",
    "icon": "assets/images/cat/spices.png",
    "number": "1",
  },
  {
    "title": "Spinach",
    "description": "spinach leaves",
    "price": "20.8",
    "icon": "assets/images/cat/Spinach.png",
    "number": "1",
  },
  {
    "title": "Vegetable",
    "description": "clean vegetables",
    "price": "45.2",
    "icon": "assets/images/cat/veg.png",
    "number": "1",
  },
];

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Food Cart'),
      ),
      body: isEmpty
          ? const EmptyView(
              icon: 'assets/images/another/cart.png',
              text: 'Your Cart is empty,\nplease come back and shopping more!')
          : ListView.builder(
              itemCount: _menus.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CartView(
                  title: _menus[index]["title"],
                  description: _menus[index]["description"],
                  icon: _menus[index]["icon"],
                  number: int.parse(_menus[index]["number"]),
                  price: _menus[index]["price"],
                  callback: (newNumber) {
                    _menus[index]["number"] = newNumber.toString();
                  },
                );
              },
            ),
    );
  }
}
