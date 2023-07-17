import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/bottom_bar.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMaterial = true;
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
          // theme: Styles.themeData(dark, context),
          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          themeMode: dark ? ThemeMode.dark : ThemeMode.light,
          home: const BottomBarSceen(),
        );
      }),
    );
  }
}
