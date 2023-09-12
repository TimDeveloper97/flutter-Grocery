import 'package:flutter/material.dart';

class TextIconCard extends StatelessWidget {
  const TextIconCard({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: Icon(icon)),
          Expanded(
              child: Text(
            text,
            style: TextStyle(fontSize: 17, color: Colors.grey),
          ))
        ],
      ),
    );
  }
}
