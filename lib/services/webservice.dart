import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_articles.dart';
import 'package:news_app/utils/constant.dart';

class Webservice {
  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    final response = await http.get(Constants.headlinesKeyword(keyword));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      print(result);
      return list.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception('failed to load');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    final response = await http.get(Constants.TOP_HEADLINE_URL);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      print(result);
      return list.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception('failed to load');
    }
  }
}
