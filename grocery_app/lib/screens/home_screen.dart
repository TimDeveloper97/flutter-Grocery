import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/consts/dummy_data.dart';
import 'package:grocery_app/inner_screens/feed_screen.dart';
import 'package:grocery_app/inner_screens/on_sale_screen.dart';

import '../consts/utils.dart';
import '../services/global_methods.dart';
import '../widgets/feed_view.dart';
import '../widgets/sale_view.dart';

final List<String> _offerImages = [
  'assets/images/offres/Offer1.jpg',
  'assets/images/offres/Offer2.jpg',
  'assets/images/offres/Offer3.jpg',
  'assets/images/offres/Offer4.jpg',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    var menus = DummyData().getMenus;
    var sales = DummyData().getSales;

    Widget slider = Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          _offerImages[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: _offerImages.length,
      autoplay: true,
      pagination: SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
            color: Colors.grey, activeColor: Theme.of(context).primaryColor),
      ),
      // control: SwiperControl(),
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: size.height * 0.3, child: slider),
          const SizedBox(height: 10),
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'FLASH SALE',
                            style: TextStyle(
                                color: Colors.amber[900],
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('See all');
                            GlobalMethods.navigateTo(
                                context: context,
                                route: OnSaleScreen.routeName);
                          },
                          child: const Text(
                            'SEE ALL',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: size.height * 0.25,
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      itemCount: sales.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SaleView(
                          title: sales[index]["title"],
                          description: sales[index]["description"],
                          icon: sales[index]["icon"],
                          priceNew: sales[index]["priceNew"],
                          priceOld: sales[index]["priceOld"],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'OUR PRODUCTS',
                    style: TextStyle(
                        color: Colors.amber[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print('See all');
                    GlobalMethods.navigateTo(
                        context: context, route: FeedScreen.routeName);
                  },
                  child: const Text(
                    'SEE ALL',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
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
          )
        ],
      ),
    );
  }
}
