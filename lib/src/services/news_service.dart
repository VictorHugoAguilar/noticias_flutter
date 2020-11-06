import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  final _URL_NEWS = 'https://newsapi.org/v2';
  final _API_KEY = '5de8c4c624a6470ca320c459fb0308a5';

  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY';
    final resp = await http.get(url);

    final newsResponse = newResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
