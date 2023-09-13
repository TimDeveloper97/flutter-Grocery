import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../consts/dummy_data.dart';
import '../consts/utils.dart';
import '../widgets/empty_view.dart';
import '../widgets/sale_view.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    var menus = DummyData().getMenus;
    var sales = DummyData().getSales;
    bool isEmpty = true;

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
        title: const Text("Products on sale"),
      ),
      body: isEmpty
          ? const EmptyView(
              icon: 'assets/images/another/box.png',
              text: 'No products on sale yet!,\nStay tuned for ours.')
          : Container(
              // height: size.height * 0.25,
              alignment: Alignment.topCenter,
              child: GridView.count(
                padding: const EdgeInsets.only(left: 10, right: 10),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: size.width / (size.height * 0.42),
                children: [
                  for (var item in sales)
                    SaleView(
                      title: item["title"],
                      description: item["description"],
                      icon: item["icon"],
                      priceNew: item["priceNew"],
                      priceOld: item["priceOld"],
                    )
                ],
              ),
            ),
    );
  }
}
