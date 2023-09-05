import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class CategoryItemView extends StatelessWidget {
  const CategoryItemView(
      {super.key,
      required this.title,
      required this.number,
      required this.icon,
      required this.onPress});

  final String title;
  final int number;
  final String icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return InkWell(
      onTap: onPress,
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
              child: Card(
                color: themeState.getDarkTheme ? Colors.black : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          color: themeState.getDarkTheme
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '$number items',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 100,
                    child: Image.asset(icon, fit: BoxFit.fitHeight),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Card(
                      color: Colors.purple[600],
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 55,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
