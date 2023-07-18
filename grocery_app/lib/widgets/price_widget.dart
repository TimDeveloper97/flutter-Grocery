import 'package:flutter/material.dart';

import '../consts/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Utils(context).getColor;

    return FittedBox(
      child: Row(
        children: [
          Text(
            '1.59\$',
            style: TextStyle(
              color: color,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            '1.59\$',
            style: TextStyle(
              fontSize: 15,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
