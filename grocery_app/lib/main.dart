import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'consts/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvder = DarkThemeProvider();

  void getCurrentAppTheme() async {
    // get theme and set data to set dark theme
    themeChangeProvder.setDarkTheme =
        await themeChangeProvder.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return themeChangeProvder;
          },
        )
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        final dark = themeProvider.getDarkTheme;
        return MaterialApp(
          title: 'Grocery',
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(dark, context),
          home: const HomeScreen(),
        );
      }),
    );
  }
}
