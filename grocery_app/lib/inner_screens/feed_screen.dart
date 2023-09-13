import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../consts/dummy_data.dart';
import '../consts/utils.dart';
import '../widgets/empty_view.dart';
import '../widgets/feed_view.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = "/FeedScreen";
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();

  @override
  void dispose() {
    _searchTextController.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
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
        title: const Text("Our products"),
      ),
      body: isEmpty
          ? const EmptyView(
              icon: 'assets/images/another/box.png',
              text: 'No products for sale yet!,\nStay tuned for ours.')
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      height: kBottomNavigationBarHeight,
                      child: TextField(
                        focusNode: _searchTextFocusNode,
                        controller: _searchTextController,
                        onChanged: (valuee) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 1),
                          ),
                          hintText: "What's in your mind",
                          prefixIcon: const Icon(Icons.search),
                          suffix: IconButton(
                            onPressed: () {
                              _searchTextController.clear();
                              _searchTextFocusNode.unfocus();
                            },
                            icon: Icon(
                              Icons.close,
                              color: _searchTextFocusNode.hasFocus
                                  ? Colors.red
                                  : color,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
