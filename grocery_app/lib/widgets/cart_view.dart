import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../consts/utils.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.red,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
