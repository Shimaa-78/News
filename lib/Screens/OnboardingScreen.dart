import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:news/Helpers/HiveHelper.dart';
import 'package:news/Models/OnBoardingModel.dart';
import 'package:news/Screens/Home.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPageIndex = 0;

  void nextPage() {

    setState(() {
      if (currentPageIndex < OnboardinModelList.length - 1) {
        currentPageIndex++;


      }
      else{
        Get.offAll(HomeScreen());
      }
    });
  }
  @override
  void initState() {
    HiveHelper.setOnboarding();
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with responsive width
          SizedBox(

            child: Image.asset("${OnboardinModelList[currentPageIndex].imagePath}", fit: BoxFit.cover,),
          ),
          SizedBox(height: screenHeight * 0.02), // Responsive spacing
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Text(
              "${OnboardinModelList[currentPageIndex].title}",
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.06, // Responsive font size
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01), // Responsive spacing
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Text(
              "${OnboardinModelList[currentPageIndex].discreption}",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.04, // Responsive font size
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05), // Responsive spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("${OnboardinModelList[currentPageIndex].imageNumberPath}", width: screenWidth * 0.2), // Responsive width
                GestureDetector(
                  onTap: () {
                    nextPage();
                  },
                  child: Image.asset("assets/images/next.png", width: screenWidth * 0.2), // Responsive width
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
