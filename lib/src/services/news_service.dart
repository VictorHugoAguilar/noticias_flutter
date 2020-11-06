import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() {
    print('cargando headlines');
  }
}
