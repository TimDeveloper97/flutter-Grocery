import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
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

const List<Map<String, dynamic>> _menus = [
  {
    "title": "Nutritional cereals",
    "subTitle": "whole grains",
    "description":
        "Breakfast cereal is a breakfast food made from processed cereal grains. It is traditionally eaten as part of breakfast, or a snack food, primarily in Western societies.\nAlthough warm cereals like porridge and grits have the longest history, ready-to-eat cold cereals appeared around the late 19th century and are most often mixed with dairy products, traditionally cow's milk. They can also be paired with yogurt or plant-based milks, or eaten plain. Fruit or nuts are sometimes added. Many cereals are produced via extrusion.",
    "price": "110.4",
    "icon": "assets/images/cat/nuts.png"
  },
  {
    "title": "Dried fruit",
    "description":
        "Dried fruit is fruit from which the majority of the original water content has been removed either naturally, through sun drying, or through the use of specialized dryers or dehydrators. Dried fruit has a long tradition of use dating back to the fourth millennium BC in Mesopotamia, and is prized because of its sweet taste, nutritive value, and long shelf life.",
    "subTitle": "clean fruit",
    "price": "8.4",
    "icon": "assets/images/cat/fruits.png"
  },
  {
    "title": "Grains and cereals",
    "description":
        "Grains refer to any type of seed that can be ground into flour or used for food, while cereals are specifically derived from grasses such as wheat, rice, and corn. Both offer a range of nutritional benefits, including fiber, vitamins, minerals, and protein.",
    "subTitle": "whole grains",
    "price": "19.2",
    "icon": "assets/images/cat/grains.png"
  },
  {
    "title": "Spices",
    "description":
        "A spice is a seed, fruit, root, bark, or other plant substance primarily used for flavoring or coloring food. Spices are distinguished from herbs, which are the leaves, flowers, or stems of plants used for flavoring or as a garnish. Spices are sometimes used in medicine, religious rituals, cosmetics, or perfume production. For example, vanilla is commonly used as an ingredient in fragrance manufacturing.",
    "subTitle": "Spices and condiments",
    "price": "50",
    "icon": "assets/images/cat/spices.png"
  },
  {
    "title": "Spinach",
    "description":
        "Spinach (Spinacia oleracea) is a leafy green flowering plant native to central and Western Asia. It is of the order Caryophyllales, family Amaranthaceae, subfamily Chenopodioideae. Its leaves are a common edible vegetable consumed either fresh, or after storage using preservation techniques by canning, freezing, or dehydration. It may be eaten cooked or raw, and the taste differs considerably; the high oxalate content may be reduced by steaming.",
    "subTitle": "spinach leaves",
    "price": "20.8",
    "icon": "assets/images/cat/Spinach.png"
  },
  {
    "title": "Vegetable",
    "description":
        "Vegetables are parts of plants that are consumed by humans or other animals as food. The original meaning is still commonly used and is applied to plants collectively to refer to all edible plant matter, including the flowers, fruits, stems, leaves, roots, and seeds. An alternative definition of the term is applied somewhat arbitrarily, often by culinary and cultural tradition. It may exclude foods derived from some plants that are fruits, flowers, nuts, and cereal grains, but include savoury fruits such as tomatoes and courgettes, flowers such as broccoli, and seeds such as pulses.",
    "subTitle": "clean vegetables",
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
              for (var item in _menus)
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
