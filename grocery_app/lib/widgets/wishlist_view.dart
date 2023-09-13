import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/consts/utils.dart';
import 'package:grocery_app/widgets/price_widget.dart';

import '../inner_screens/item_detail_screen.dart';

class WishlistView extends StatefulWidget {
  const WishlistView(
      {super.key,
      required this.title,
      required this.description,
      required this.icon,
      required this.priceNew,
      required this.priceOld});

  final String title;
  final String description;
  final String icon;
  final String priceNew;
  final String priceOld;

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    final color = Utils(context).getColor;
    final bool isDark = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: isDark ? Colors.black : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailScreen(
                    title: widget.title,
                    description: widget.description,
                    number: 1,
                    icon: widget.icon,
                    priceNew: double.parse(widget.priceNew),
                    priceOld: double.parse(widget.priceOld),
                  ),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl: widget.icon,
                      height: size.height * 0.1,
                      width: size.width * 0.22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('bag2');
                              },
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('heart');
                              },
                              child: const Icon(
                                IconlyBold.heart,
                                size: 22,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '\$${widget.priceNew}',
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: color, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
