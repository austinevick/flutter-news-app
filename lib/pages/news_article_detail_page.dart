import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/view_model/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailPage extends StatefulWidget {
  final NewsArticleViewModel vm;

  const NewsArticleDetailPage({Key key, this.vm}) : super(key: key);

  @override
  _NewsArticleDetailPageState createState() => _NewsArticleDetailPageState();
}

class _NewsArticleDetailPageState extends State<NewsArticleDetailPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text(widget.vm.title),),
     body: WebView(
       javascriptMode: JavascriptMode.unrestricted,
         initialUrl: widget.vm.url,
     ),
    );
  }
}