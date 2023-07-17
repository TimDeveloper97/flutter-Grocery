import 'package:flutter/material.dart';

class GroupView extends StatelessWidget {
  const GroupView({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            margin: const EdgeInsets.only(left: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
