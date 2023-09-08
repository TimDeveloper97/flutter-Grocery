import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/user_screen.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarSceen extends StatefulWidget {
  const BottomBarSceen({super.key});

  @override
  State<BottomBarSceen> createState() => _BottomBarSceenState();
}

class _BottomBarSceenState extends State<BottomBarSceen> {
  int _selectedIndex = 2;
  final List<Map<String, dynamic>> _pages = const [
    {"title": "Home Screen", "page": HomeScreen()},
    {"title": "Categories Screen", "page": CategoriesScreen()},
    {"title": "Cart Screen", "page": CartScreen()},
    {"title": "User Screen", "page": UserScreen()},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: isDark
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).primaryColorDark,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? Icons.account_circle
                  : Icons.account_circle_outlined),
              label: 'User'),
        ],
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
