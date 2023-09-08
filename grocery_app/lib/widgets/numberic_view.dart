import 'package:flutter/material.dart';
import '../consts/utils.dart';

class NumbericView extends StatefulWidget {
  NumbericView({super.key, required this.number, required this.callback});
  int number;
  final Function(int newNumber) callback;
  @override
  State<NumbericView> createState() => _NumbericViewState();
}

class _NumbericViewState extends State<NumbericView> {

  @override
  void initState() {
    // TODO: implement initState
    if (widget.number < 0) {
      setState(() {
        widget.number = 0;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Utils(context).getTheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              print('+');
              setState(() {
                widget.number++;
              });
              widget.callback(widget.number);
            },
            child: const Text(
              '+',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '${widget.number}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: themeState ? Colors.white : Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print('-');
              if (widget.number > 1) {
                setState(() {
                  widget.number--;
                });
                widget.callback(widget.number);
              }
            },
            child: const Text(
              '-',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
