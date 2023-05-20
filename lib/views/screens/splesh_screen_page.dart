import 'dart:async';
import 'package:contact_diary_viva/utils/rautes_page.dart';
import 'package:flutter/material.dart';
import '../../utils/icon_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed(MyRoutes.home);
      timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(iconPath + "Calling.gif"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
