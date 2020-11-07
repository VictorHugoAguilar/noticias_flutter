import 'package:flutter/material.dart';
import 'package:noticias/src/models/category_models.dart';
import 'package:noticias/src/services/news_service.dart';
import 'package:noticias/src/theme/theme_Dark.dart';
import 'package:noticias/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          _ListaCategoria(),
          !newsService.cargando
              ? Expanded(
                  child: ListaNoticias(
                      newsService.getArticulosCategoriaSeleccionada))
              : Expanded(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
        ],
      ),
    ));
  }
}

class _ListaCategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                SizedBox(height: 5.0),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    // Icon(categoria.icon)
    return GestureDetector(
      onTap: () {
        // print(categoria.name);
        final newsService = Provider.of<NewsService>(context, listen: false);

        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == this.categoria.name)
              ? myTheme.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
