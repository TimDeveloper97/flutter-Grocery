import 'package:flutter/material.dart';

class TileBetweenView extends StatelessWidget {
  TileBetweenView(
      {super.key,
      required this.title,
      required this.description,
      this.sizeDescription = 17});

  final String title;
  final String description;
  late double sizeDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: sizeDescription,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
