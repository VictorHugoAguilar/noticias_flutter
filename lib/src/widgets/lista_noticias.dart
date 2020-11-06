import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:noticias/src/theme/theme_Dark.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  // de esta manera estamos obligando que se le pasen la lista de noticias
  ListaNoticias(this.noticias);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(
          noticia: this.noticias[index],
          index: index,
        );
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({
    @required this.noticia,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(this.noticia, this.index),
        _TarjetaTitulo(this.noticia),
        _TarjetaImagen(this.noticia),
        _TarjetaBody(this.noticia),
        _TarjetaBotones(),
        SizedBox(height: 10.0),
        Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.star_outline),
          ),
          SizedBox(width: 20.0),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  image: NetworkImage(noticia.urlToImage),
                  placeholder: AssetImage('assets/img/giphy.gif'),
                )
              : Image(image: AssetImage('assets/img/no-image.png')),
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar(
    this.noticia,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: myTheme.accentColor),
          ),
          Text('${noticia.source.name}. ')
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text((noticia.description) != null ? noticia.description : ''),
    );
  }
}
