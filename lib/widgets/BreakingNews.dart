import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Screens/webView.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import this package

import '../Models/news.dart';
import '../cubit/home_cubit.dart';

class TrendinNewsWidget extends StatefulWidget {
  @override
  _TrendinNewsWidgetState createState() => _TrendinNewsWidgetState();
}

class _TrendinNewsWidgetState extends State<TrendinNewsWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubet, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        final cubit = context.read<HomeCubet>();
        final bannerData = cubit.newsModel.articles;

        if (state is HomeBannerLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeBannerError) {
          return Center(child: Text("${state.msg}"));
        }

        return Column(
          children: [
            CarouselSlider(
              items: List.generate(
                bannerData?.length ?? 0,
                    (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WebViewScreen(url: bannerData?[index]?.url ?? ""),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: bannerData?[index]?.urlToImage ?? "",
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),

                          // child: Image.network(
                          //   bannerData?[index]?.urlToImage ?? "",
                          //   height: 300,
                          //   width: MediaQuery.of(context).size.width,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 60,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "${bannerData?[index]?.title ?? ""}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count:bannerData?.length ?? 0,
              effect: WormEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.blue,
                dotHeight: 12,
                dotWidth: 12,
                spacing: 16,
              ),
            ),
          ],
        );
      },
    );
  }
}
