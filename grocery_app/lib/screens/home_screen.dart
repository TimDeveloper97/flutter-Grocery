import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/utils.dart';
import '../widgets/feed_view.dart';
import '../widgets/sale_view.dart';

final List<String> _offerImages = [
  'assets/images/offres/Offer1.jpg',
  'assets/images/offres/Offer2.jpg',
  'assets/images/offres/Offer3.jpg',
  'assets/images/offres/Offer4.jpg',
];

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
                            style: GoogleFonts.aBeeZee(
                                color: Colors.amber[900],
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('See all');
                          },
                          child: Text(
                            'SEE ALL',
                            style: GoogleFonts.aBeeZee(
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
                      itemCount: _sales.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SaleView(
                          title: _sales[index]["title"],
                          description: _sales[index]["description"],
                          icon: _sales[index]["icon"],
                          priceNew: _sales[index]["priceNew"],
                          priceOld: _sales[index]["priceOld"],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
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
          )
        ],
      ),
    );
  }
}
