import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/pages/news_article_detail_page.dart';
import 'package:news_app/pages/news_search_screen.dart';
import 'package:news_app/view_model/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewsSearchScreen()));
              })
        ],
      ),
      body: vm.articles.isEmpty
          ? Center(
              child: SpinKitWave(
              color: Colors.blue,
            ))
          : ListView.builder(
              itemCount: vm.articles.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewsArticleDetailPage(
                                vm: vm.articles[index],
                              )));
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
                            height: 80,
                            width: 80,
                            child: Image.network(
                              vm.articles[index].urlToImage,
                              fit: BoxFit.cover,
                            )),
                    title: Text(
                      vm.articles[index].title,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(vm.articles[index].name),
                  ),
                );
              }),
    );
  }
}
