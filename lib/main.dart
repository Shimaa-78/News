import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news/cubit/all_news_cubit.dart';

import 'Helpers/HiveHelper.dart';
import 'Screens/Splash.dart';
import 'cubit/home_cubit.dart';
import 'cubit/Trending.dart';


void main() async{
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.onboardingBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          HomeCubet()
            ..getBanners(),
          // Add WebViewCubit if you plan to use it

        ),
        BlocProvider(
          create: (context) => TrendingCubit()..getBreaking(),
        ),
        BlocProvider(
          create: (context) => AllNewsCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
