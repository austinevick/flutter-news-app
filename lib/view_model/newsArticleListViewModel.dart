import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_articles.dart';
import 'package:news_app/services/webservice.dart';
import 'package:news_app/view_model/newsArticleViewModel.dart';



class NewsArticleListViewModel extends ChangeNotifier{
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

Future<void> searchNews(String keyword)async{
  List<NewsArticle> newsArticle = await Webservice().fetchHeadlinesByKeyword(keyword);
  this.articles = newsArticle.map((e) => NewsArticleViewModel(article: e)).toList();
  notifyListeners();
}

 Future<void> populateTopHeadlines()async{
  List<NewsArticle> newsArticle = await Webservice().fetchTopHeadLines();
  this.articles = newsArticle.map((e) => NewsArticleViewModel(article: e)).toList();
  notifyListeners();
  }
}
