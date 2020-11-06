import 'package:flutter/material.dart';
import 'package:noticias/src/pages/tabs_page.dart';
import 'package:noticias/src/services/news_service.dart';
import 'package:noticias/src/theme/theme_Dark.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new NewsService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        title: 'Flutter Demo',
        home: TabsPage(),
      ),
    );
  }
}
