import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/category_item_view.dart';
import '../consts/utils.dart';

final List<Map<String, dynamic>> _categories = [
  {'title': 'Fruits', 'number': 10, 'icon': 'assets/images/cat/fruits.png'},
  {'title': 'Grains', 'number': 30, 'icon': 'assets/images/cat/grains.png'},
  {'title': 'Vegetables', 'number': 12, 'icon': 'assets/images/cat/veg.png'},
  {'title': 'Meats', 'number': 6, 'icon': 'assets/images/cat/meatpig.png'},
];

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Utils(context).getTheme;

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
                decoration: BoxDecoration(color: Colors.purple[600]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    color: themeState ? Colors.black12 : Colors.white),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    color: themeState ? Colors.black12 : Colors.white),
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
                    const Expanded(
                      child: Text(
                        'Cate',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'gories',
                        style: TextStyle(
                          color: Colors.purple[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
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
