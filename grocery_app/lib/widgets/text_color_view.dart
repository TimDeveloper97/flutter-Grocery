import 'package:flutter/material.dart';

class TextColorView extends StatelessWidget {
  const TextColorView({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        )
      ],
    );
  }
}
