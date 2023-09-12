import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/consts/utils.dart';
import 'package:grocery_app/widgets/item_detail_view.dart';
import 'package:provider/provider.dart';
import '../provider/dark_theme_provider.dart';
import '../services/global_methods.dart';

class FeedView extends StatefulWidget {
  const FeedView(
      {super.key,
      required this.title,
      required this.description,
      required this.icon,
      required this.price,
      required this.subTitle});

  final String title;
  final String subTitle;
  final String description;
  final String icon;
  final String price;

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final color = Utils(context).getColor;
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: themeState.getDarkTheme ? Colors.black : Colors.grey[100],
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailView(
                    title: widget.title,
                    description: widget.description,
                    number: 1,
                    icon: widget.icon,
                    price: double.parse(widget.price),
                  ),
                ));
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      print('heart');
                    },
                    child: Icon(
                      IconlyLight.heart,
                      size: 22,
                      color: color,
                    ),
                  ),
                ),
                FancyShimmerImage(
                  imageUrl: widget.icon,
                  height: size.height * 0.12,
                  width: size.width * 0.3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
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
                        widget.subTitle,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "\$${widget.price}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
