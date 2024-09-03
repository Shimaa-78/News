import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Screens/webView.dart';

import '../cubit/all_news_cubit.dart';
import '../cubit/home_cubit.dart';

class AllNewsScreen extends StatelessWidget {
  final String category;
  // Changed to lowercase and marked as final

  // Constructor with required parameter
  AllNewsScreen({required this.category}); // Marked as required

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            category, // Use the lowercase parameter name
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: BlocBuilder<AllNewsCubit, AllNewsState>(
        builder: (context, state) {
          final cubit2 = context.read<AllNewsCubit>();
          final Data2 = cubit2.newsModel.articles;
          print(Data2?[0]?.urlToImage ?? "");

          if (state is AllLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AllError) {
            return Center(child: Text("${state.msg}"));
          }
          return ListView.builder(
              itemCount: Data2?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    shadowColor: Colors.grey,
                    elevation: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WebViewScreen(url: Data2?[index]?.url ?? ""),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${Data2?[index]?.author ?? ""}",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                //
                              ),
                            ),
                            Text(
                              "${Data2?[index]?.title ?? ""}",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),

                              // fit: BoxFit.fill,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text("${Data2?[index]?.source?.name ?? ""}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Icon(Icons.access_time,size: 13,),
                                    SizedBox(width: 5,),
                                    Text("${Data2?[index]?.publishedAt ?? ""}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      // You can add more widgets here
    );
  }
}
