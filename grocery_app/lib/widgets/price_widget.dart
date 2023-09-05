import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key, required this.priceNew, required this.priceOld});

  final String priceNew;
  final String priceOld;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Text(
            '$priceNew \$',
            style: TextStyle(
              color: Colors.amber[900],
              fontSize: 22,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            '$priceOld \$',
            style: const TextStyle(
              fontSize: 15,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
