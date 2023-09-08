import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/consts/utils.dart';
import 'package:grocery_app/widgets/price_widget.dart';

class SaleView extends StatefulWidget {
  const SaleView(
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
  State<SaleView> createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView> {
  @override
  Widget build(BuildContext context) {
    final color = Utils(context).getColor;
    Size size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
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
                    Column(
                      children: [
                        Text(
                          widget.description,
                          style: TextStyle(
                              fontSize: 22,
                              color: color,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
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
                              child: Icon(
                                IconlyLight.heart,
                                size: 22,
                                color: color,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                PriceWidget(
                  priceNew: widget.priceNew,
                  priceOld: widget.priceOld,
                ),
                const SizedBox(height: 5),
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
