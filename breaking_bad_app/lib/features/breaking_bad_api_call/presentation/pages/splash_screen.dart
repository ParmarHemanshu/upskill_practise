import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Timer(const Duration(seconds: 2), () async {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return const HomePage();
          }),(route)=>false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Center(
          child:  Image.asset(
            "img/app_logo.png",
          )
        ),
      ),
    );
  }
}
