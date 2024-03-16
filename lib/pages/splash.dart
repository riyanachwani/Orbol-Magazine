import 'package:flutter/material.dart';
import 'package:orbol_magazine/utils/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Colors.white,
        body: Center(
      child: Container(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          width: 100,
          height: 100,
          alignment: Alignment.center,
        ),
      ),
    ));
  }
}
