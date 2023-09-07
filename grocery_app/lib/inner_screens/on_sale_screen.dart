import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../consts/utils.dart';
import '../widgets/sale_view.dart';

const List<Map<String, dynamic>> _sales = [
  {
    "title": "BBQ Chicken",
    "description": "500g",
    "priceNew": "110.4",
    "priceOld": "130.4",
    "icon": "assets/images/sales/chicken.png"
  },
  {
    "title": "Fastfood",
    "description": "200g",
    "priceNew": "42.4",
    "priceOld": "99.3",
    "icon": "assets/images/sales/fastfood.png"
  },
  {
    "title": "Mackerel",
    "description": "1KG",
    "priceNew": "71.4",
    "priceOld": "100.4",
    "icon": "assets/images/sales/fish.png"
  },
  {
    "title": "Roast pork",
    "description": "1KG",
    "priceNew": "15.4",
    "priceOld": "32.4",
    "icon": "assets/images/sales/meat.png"
  },
  {
    "title": "Rice",
    "description": "10KG",
    "priceNew": "5.4",
    "priceOld": "7.4",
    "icon": "assets/images/sales/rice.png"
  },
  {
    "title": "Sausage",
    "description": "2KG",
    "priceNew": "10.4",
    "priceOld": "70.4",
    "icon": "assets/images/sales/sausage.png"
  },
  {
    "title": "BBQ Chicken",
    "description": "500g",
    "priceNew": "110.4",
    "priceOld": "130.4",
    "icon": "assets/images/sales/chicken.png"
  },
  {
    "title": "Fastfood",
    "description": "200g",
    "priceNew": "42.4",
    "priceOld": "99.3",
    "icon": "assets/images/sales/fastfood.png"
  },
  {
    "title": "Mackerel",
    "description": "1KG",
    "priceNew": "71.4",
    "priceOld": "100.4",
    "icon": "assets/images/sales/fish.png"
  },
  {
    "title": "Roast pork",
    "description": "1KG",
    "priceNew": "15.4",
    "priceOld": "32.4",
    "icon": "assets/images/sales/meat.png"
  },
  {
    "title": "Rice",
    "description": "10KG",
    "priceNew": "5.4",
    "priceOld": "7.4",
    "icon": "assets/images/sales/rice.png"
  },
  {
    "title": "Sausage",
    "description": "2KG",
    "priceNew": "10.4",
    "priceOld": "70.4",
    "icon": "assets/images/sales/sausage.png"
  },
];

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;

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
      body: Container(
        // height: size.height * 0.25,
        alignment: Alignment.topCenter,
        child: GridView.count(
          padding: const EdgeInsets.only(left: 10, right: 10),
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: size.width / (size.height * 0.42),
          children: [
            for (var item in _sales)
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
