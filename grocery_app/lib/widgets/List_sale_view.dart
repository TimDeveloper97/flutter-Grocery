import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/consts/utils.dart';
import 'package:grocery_app/widgets/price_widget.dart';

class SaleHorizontalView extends StatefulWidget {
  const SaleHorizontalView({super.key});

  @override
  State<SaleHorizontalView> createState() => _SaleHorizontalViewState();
}

class _SaleHorizontalViewState extends State<SaleHorizontalView> {
  @override
  Widget build(BuildContext context) {
    final color = Utils(context).getColor;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                    Image.network(
                      'assets/images/cat/nuts.png',
                      height: size.height * 0.1,
                      width: size.width * 0.22,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Text(
                          '1KG',
                          style: GoogleFonts.aBeeZee(
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
                PriceWidget(),
                const SizedBox(height: 5),
                Text(
                  'Product title',
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
