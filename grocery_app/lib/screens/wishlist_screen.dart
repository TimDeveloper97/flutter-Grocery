import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../consts/dummy_data.dart';
import '../consts/utils.dart';
import '../widgets/empty_view.dart';
import '../widgets/feed_view.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    final Size size = Utils(context).getScreenSize;
    var menus = DummyData().getMenus;
    var sales = DummyData().getSales;
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              tooltip: 'Remove all',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Remove all item in wishlist')));
              },
            ),
          ),
        ],
      ),
      body: isEmpty
          ? const EmptyView(
              icon: 'assets/images/another/wishlist.png',
              text: 'Favorites list is empty.')
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: GridView.count(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: size.width / (size.height * 0.62),
                      children: [
                        for (var item in menus)
                          FeedView(
                              title: item["title"],
                              subTitle: item["subTitle"],
                              description: item["description"],
                              icon: item["icon"],
                              price: item["price"])
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
