import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/all_news_cubit.dart';
import '../Models/Category.dart';
import '../Screens/allNewsScreen.dart';
import '../cubit/home_cubit.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel? category;
  CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cubit = context.read<AllNewsCubit>();

    return InkWell(

      onTap:(){
        cubit.getallNews(category!.CategoryNAme??"");
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllNewsScreen(category:category!.CategoryNAme??""), // Pass the URL
        ),
      );},
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
        child: Container(
          width: screenWidth * 0.45, // Responsive width (25% of screen width)
          height: screenHeight * 0.35, // Responsive height (15% of screen height)
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.04)), // Responsive border radius
            image: DecorationImage(
              image: AssetImage("${category!.image}"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Text(
              "${category!.CategoryNAme}",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04, // Responsive font size
              ),
              textAlign: TextAlign.center, // Center the text
            ),
          ),
        ),
      ),
    );
  }
}
