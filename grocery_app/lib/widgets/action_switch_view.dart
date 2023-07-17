import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionSwitchView extends StatefulWidget {
  ActionSwitchView(
      {super.key,
      required this.icon,
      required this.title,
      this.description,
      required this.onPress,
      required this.color,
      this.value});

  final IconData icon;
  final Color color;
  final String title;
  final String? description;
  bool? value;
  final void Function(bool newValue) onPress;

  @override
  State<ActionSwitchView> createState() => _ActionViewSwitchState();
}

class _ActionViewSwitchState extends State<ActionSwitchView> {
  void _execute(bool newValue) {
    setState(() {
      widget.value = newValue;
    });
    widget.onPress(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _execute(!widget.value!),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.color,
            ),
            child: Icon(
              widget.icon,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(widget.title),
              subtitle: widget.description != null
                  ? Text(
                      widget.description!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    )
                  : null,
            ),
          ),
          Switch(
            value: widget.value ?? false,
            onChanged: _execute,
          )
        ],
      ),
    );
  }
}
