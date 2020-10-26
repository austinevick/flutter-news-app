import 'package:flutter/material.dart';
import 'package:news_app/pages/news_list.dart';
import 'package:news_app/view_model/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsArticleListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter News App',
        theme: ThemeData.dark(),
        home: NewsList(),
      ),
    );
  }
}
