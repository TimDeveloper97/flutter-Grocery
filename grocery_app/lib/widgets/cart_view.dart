import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../consts/utils.dart';
import '../inner_screens/item_detail_screen.dart';
import 'numberic_view.dart';

class CartView extends StatefulWidget {
  const CartView(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      required this.price,
      required this.number,
      required this.updateNumberic,
      required this.removeItem,
      required this.id});

  final String icon;
  final String id;
  final String title;
  final String description;
  final int number;
  final String price;
  final Function(int newNumber) updateNumberic;
  final Function(String id) removeItem;
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  void closePopup(String id, String name) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: Text('Are you sure want to remove \'$name\' from cart?'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              widget.removeItem(id);
            },
            child: const Text('Yes'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return Container(
      width: double.infinity,
      height: size.height * 0.15,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailScreen(
                  title: widget.title,
                  description: widget.description,
                  number: 1,
                  icon: widget.icon,
                  priceNew: double.parse(widget.price),
                ),
              ));
        },
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: NumbericView(
                    number: widget.number,
                    callback: widget.updateNumberic,
                    axis: Axis.vertical,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    children: [
                      FancyShimmerImage(
                        imageUrl: widget.icon,
                        height: size.height * 0.12,
                        width: size.width * 0.25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.description,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${widget.price}',
                            style: const TextStyle(
                              color: Colors.purple,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton.filled(
                      padding: const EdgeInsets.only(bottom: 1),
                      onPressed: () => closePopup(widget.id, widget.title),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 14,
                      ),
                      alignment: Alignment.center,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
