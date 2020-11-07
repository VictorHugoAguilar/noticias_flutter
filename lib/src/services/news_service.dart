import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/src/models/category_models.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  // ignore: non_constant_identifier_names
  final _URL_NEWS = 'https://newsapi.org/v2';
  // ignore: non_constant_identifier_names
  final _API_KEY = '5de8c4c624a6470ca320c459fb0308a5';

  String _selectedCategory = 'entertainment';
  // flag para saber si esta cargando desde la api
  bool _cargando = true;

  List<Article> headlines = [];

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();

    categories.forEach((item) {
      this.categoryArticles[item.name] = new List();
    });
  }

  bool get cargando => this._cargando;

  get selectedCategory => this._selectedCategory;

  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this._cargando = true;
    this.getArticlesByCategory(valor);

    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?country=ar&apiKey=$_API_KEY';
    final resp = await http.get(url);

    final newsResponse = newResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) {
      this._cargando = false;
      notifyListeners();
      return this.categoryArticles[category];
    }

    final url =
        '$_URL_NEWS/top-headlines?country=ar&apiKey=$_API_KEY&category=$category';
    final resp = await http.get(url);

    final newsResponse = newResponseFromJson(resp.body);

    this.categoryArticles[category].addAll(newsResponse.articles);
    this._cargando = false;

    notifyListeners();
  }
}
