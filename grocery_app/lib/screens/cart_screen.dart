import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_view.dart';

import '../widgets/empty_view.dart';

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
      body: isEmpty
          ? const EmptyView(icon: 'assets/images/another/cart.png', text: '')
          : ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return CartView();
              },
            ),
    );
  }
}
