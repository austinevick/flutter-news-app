
import 'package:news_app/models/news_articles.dart';

class NewsArticleViewModel {
  
 NewsArticle _newsArticle;
 NewsArticleViewModel({NewsArticle article}): _newsArticle = article;
 
 String get title{
   return _newsArticle.title;
 }
 String get description{
   return _newsArticle.description;
 }
 String get urlToImage{
   return _newsArticle.urlToImage;
 }
 String get url{
   return _newsArticle.url;
 }
 String get name{
   return _newsArticle.name;
 }
 String get publishedAt{
   return _newsArticle.publishedAt;
 }
} 