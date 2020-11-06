import 'package:flutter/material.dart';
import 'package:noticias/src/services/news_service.dart';
import 'package:noticias/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsService>(context);

    //newsServices.headlines;

    return Scaffold(
      body: ListaNoticias(newsServices.headlines),
    );
  }
}
