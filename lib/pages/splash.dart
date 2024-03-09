import 'package:flutter/material.dart';
import 'package:orbol_magazine/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () async {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MyRoutes.homeRoute,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Image.asset("assets/images/logo.png"),
      ),
    ));
  }
}
