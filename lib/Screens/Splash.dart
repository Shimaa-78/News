import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news/Helpers/HiveHelper.dart';
import 'package:news/Screens/Home.dart';
import 'package:news/Screens/OnboardingScreen.dart';


import 'OnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      if(HiveHelper.GetonboardingBox()){
        Get.offAll(OnboardingScreen());
      }
      else Get.offAll(HomeScreen());


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/Logo.png",
          // width: 100,
        ),
      ),
    );
  }
}
