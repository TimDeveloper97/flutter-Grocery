import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import '../consts/utils.dart';
import '../widgets/List_sale_view.dart';

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

    return Column(
      children: [
        SizedBox(height: size.height * 0.3, child: slider),
        const SizedBox(height: 6),
        const SizedBox(height: 6),
        Container(
          height: size.height * 0.22,
          alignment: Alignment.centerLeft,
          child: ListView.builder(
            itemCount: 21,
            // physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const SaleHorizontalView();
            },
          ),
        )
      ],
    );
  }
}
