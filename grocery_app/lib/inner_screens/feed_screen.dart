import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../consts/utils.dart';
import '../widgets/empty_view.dart';
import '../widgets/feed_view.dart';

const List<Map<String, dynamic>> _menus = [
  {
    "title": "Nutritional cereals",
    "description": "whole grains",
    "price": "110.4",
    "icon": "assets/images/cat/nuts.png"
  },
  {
    "title": "Dried fruit",
    "description": "clean fruit",
    "price": "8.4",
    "icon": "assets/images/cat/fruits.png"
  },
  {
    "title": "Grains and cereals",
    "description": "whole grains",
    "price": "19.2",
    "icon": "assets/images/cat/grains.png"
  },
  {
    "title": "Spices",
    "description": "Spices and condiments",
    "price": "50",
    "icon": "assets/images/cat/spices.png"
  },
  {
    "title": "Spinach",
    "description": "spinach leaves",
    "price": "20.8",
    "icon": "assets/images/cat/Spinach.png"
  },
  {
    "title": "Vegetable",
    "description": "clean vegetables",
    "price": "45.2",
    "icon": "assets/images/cat/veg.png"
  },
];

class FeedScreen extends StatelessWidget {
  static const routeName = "/FeedScreen";
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    bool isEmpty = false;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: () => Navigator.pop(context),
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        title: const Text("Our products"),
      ),
      body: isEmpty
          ? const EmptyView(
              icon: 'assets/images/another/box.png',
              text: 'No products for sale yet!,\nStay tuned for ours.')
          : Container(
              alignment: Alignment.topCenter,
              child: GridView.count(
                padding: const EdgeInsets.only(left: 10, right: 10),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: size.width / (size.height * 0.62),
                children: [
                  for (var item in _menus)
                    FeedView(
                        title: item["title"],
                        description: item["description"],
                        icon: item["icon"],
                        price: item["price"])
                ],
              ),
            ),
    );
  }
}
