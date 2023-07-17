import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/widgets/category_item_view.dart';
import 'package:provider/provider.dart';

import '../consts/colors.data.dart';
import '../provider/dark_theme_provider.dart';

final List<Map<String, dynamic>> _categories = [
  {'title': 'Fruit', 'number': 10, 'icon': 'assets/images/cat/fruits.png'},
  {'title': 'Grain', 'number': 30, 'icon': 'assets/images/cat/grains.png'},
  {'title': 'Nut', 'number': 44, 'icon': 'assets/images/cat/nuts.png'},
  {'title': 'Spice', 'number': 20, 'icon': 'assets/images/cat/spices.png'},
  {'title': 'Spinach', 'number': 15, 'icon': 'assets/images/cat/spinach.png'},
  {'title': 'Veg', 'number': 12, 'icon': 'assets/images/cat/veg.png'},
];

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Stack(
      fit: StackFit.loose,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    color:
                        themeState.getDarkTheme ? Colors.black : Colors.white),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    color:
                        themeState.getDarkTheme ? Colors.black : Colors.white),
              ),
            ),
          ],
        ),
        // list item
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Cate',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'gories',
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              for (var category in _categories)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CategoryItemView(
                      onPress: () {},
                      title: category['title'],
                      number: category['number'],
                      icon: category['icon']),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
