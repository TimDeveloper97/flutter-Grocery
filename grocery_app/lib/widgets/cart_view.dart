import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/provider/numberic_provider.dart';

import '../consts/utils.dart';
import 'numberic_view.dart';

class CartView extends StatefulWidget {
  const CartView(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      required this.price});

  final String icon;
  final String title;
  final String description;
  final String price;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final themeState = Utils(context).getTheme;

    return Container(
      width: double.infinity,
      height: size.height * 0.15,
      margin: const EdgeInsets.all(8),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: NumbericView(number: number),
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
                    onPressed: () {},
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
    );
  }
}
