import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/view_model/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

import 'news_article_detail_page.dart';

class NewsSearchScreen extends StatefulWidget {
  @override
  _NewsSearchScreenState createState() => _NewsSearchScreenState();
}

class _NewsSearchScreenState extends State<NewsSearchScreen> {
  final controller = new TextEditingController();
  Timer timer;
  @override
  void initState() {
    controller.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(8),
          child: TextField(
            autocorrect: true,
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            controller: controller,
            cursorColor: Colors.white,
            onChanged: (value) {
              if (timer?.isActive ?? false) timer.cancel();
              timer = new Timer(Duration(milliseconds: 2000), () {
                vm.searchNews(value);
              });
            },
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.clear();
                    }),
                enabledBorder: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white60),
                hintText: 'Search'),
          ),
        ),
      ),
      body: vm.articles.isEmpty
          ? Center(
              child: Text(
              'No match found',
              style: TextStyle(),
            ))
          : ListView.builder(
              itemCount: vm.articles.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => 
                          NewsArticleDetailPage(vm: vm.articles[index],)));
                    },
                    leading: vm.articles[index].urlToImage == null
                        ? Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'image/news.png',
                              fit: BoxFit.cover,
                            ))
                        : Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              vm.articles[index].urlToImage,
                              fit: BoxFit.cover,
                            )),
                    title: Text(
                      vm.articles[index].title,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                );
              }),
    );
  }
}
