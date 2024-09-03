import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/ListData.dart';
import '../cubit/Trending.dart';
import '../widgets/BreakingNews.dart';
import '../widgets/CategoryWidget.dart';
import '../widgets/TrendingNews.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "assets/images/Logo.png",
            width: 150,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Categories.length,
                  itemBuilder: ((context, index) {
                    return CategoryWidget(category: Categories[index]);
                  }),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                )),
            SliverToBoxAdapter(
                child:
                    Text(
                      "Breaking News!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
            SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                )),
            SliverToBoxAdapter(child: TrendinNewsWidget()),
            SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                )),
            SliverToBoxAdapter(

                    child:Text(
                      "Trending News!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),

                ),
            SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                )),
            TrendingNews(),
          ],
        ),
      ),
    );
  }
}
