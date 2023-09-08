import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_view.dart';

import '../widgets/empty_view.dart';

const List<Map<String, dynamic>> _menus = [
  {
    "title": "Nutritional cereals",
    "description": "whole grains",
    "price": "110.4",
    "icon": "assets/images/cat/nuts.png"
  },
  {
    "title": "Dried fruit",
    "description": "clean fruit",
    "price": "8.4",
    "icon": "assets/images/cat/fruits.png"
  },
  {
    "title": "Grains and cereals",
    "description": "whole grains",
    "price": "19.2",
    "icon": "assets/images/cat/grains.png"
  },
  {
    "title": "Spices",
    "description": "Spices and condiments",
    "price": "50",
    "icon": "assets/images/cat/spices.png"
  },
  {
    "title": "Spinach",
    "description": "spinach leaves",
    "price": "20.8",
    "icon": "assets/images/cat/Spinach.png"
  },
  {
    "title": "Vegetable",
    "description": "clean vegetables",
    "price": "45.2",
    "icon": "assets/images/cat/veg.png"
  },
];

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEmpty = true;

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
                    price: _menus[index]["price"]);
              },
            ),
    );
  }
}
