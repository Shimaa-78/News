import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/Trending.dart';
import '../Screens/webView.dart';

class TrendingNews extends StatelessWidget {
  TrendingNews();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
      builder: (context, state) {
        final cubit = context.read<TrendingCubit>();
        final data = cubit.newsModel2?.articles;

        if (state is HomeTrendingLoading) {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HomeTrindingError) {
          return SliverFillRemaining(
            child: Center(child: Text("${state.msg}")),
          );
        }

        // Use SliverList directly
        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WebViewScreen(url: data?[index]?.url ?? ""),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Material(
                    elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                             child:CachedNetworkImage(
                               imageUrl: data?[index]?.urlToImage ?? "",
                               height: 120,


                               width: 120,
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
                            // Image.network(
                            //   data?[index]?.urlToImage ?? "",
                            //   width: 120,
                            //   height: 120,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                data?[index]?.title ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                data?[index]?.content ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: data?.length ?? 0,
          ),
        );
      },
    );
  }
}
