import 'package:flutter/material.dart';
import '../consts/utils.dart';

class NumbericView extends StatefulWidget {
  NumbericView(
      {super.key,
      required this.number,
      required this.callback,
      required this.axis});

  int number;
  final Function(int newNumber) callback;
  final Axis axis;

  @override
  State<NumbericView> createState() => _NumbericViewState();
}

class _NumbericViewState extends State<NumbericView> {
  void plusNumber() {
    print('+');
    setState(() {
      widget.number++;
    });
    widget.callback(widget.number);
  }

  void minusNumber() {
    print('-');
    if (widget.number > 1) {
      setState(() {
        widget.number--;
      });
      widget.callback(widget.number);
    }
  }

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
    final double size = 50;

    return widget.axis == Axis.vertical
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: plusNumber,
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
                  onTap: minusNumber,
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
          )
        : SizedBox(
            width: 150,
            child: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(size),
                  onTap: plusNumber,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    width: size,
                    height: size,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        '+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.number}x',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeState ? Colors.white : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(size),
                  onTap: minusNumber,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    width: size,
                    height: size,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        '-',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
