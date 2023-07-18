import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  set setTheme(bool newVaue) =>
      Provider.of<DarkThemeProvider>(context).setDarkTheme = newVaue;
  Color get getColor => getTheme ? Colors.white : Colors.black;
  Color get getColorMain => Colors.amber;
  Size get getScreenSize => MediaQuery.of(context).size;
}
