import 'package:flutter/material.dart';

class ActionView extends StatelessWidget {
  const ActionView(
      {super.key,
      required this.icon,
      required this.title,
      this.description,
      required this.onPress,
      required this.color});

  final IconData icon;
  final Color color;
  final String title;
  final String? description;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(title),
              subtitle: description != null
                  ? Text(
                      description!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    )
                  : null,
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 25,
          )
        ],
      ),
    );
  }
}
