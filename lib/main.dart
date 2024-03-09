import 'package:flutter/material.dart';
import 'package:orbol_magazine/pages/home.dart';
import 'package:orbol_magazine/pages/splash.dart';
import "utils/routes.dart";

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner:
          false, //to remove the debug that is shown on app
      initialRoute: MyRoutes.splashRoute,
      routes: {
        "/": (context) => const SplashScreen(), //object - can also use new keyword
        MyRoutes.splashRoute: (context) => SplashScreen(),
        MyRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
