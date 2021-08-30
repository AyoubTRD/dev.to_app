import 'package:flutter/material.dart';
import 'package:flutter_dev_to/screens/article_details_screen.dart';
import 'package:flutter_dev_to/screens/articles_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev forums',
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 17.0),
        ),
      ),
      home: ArticlesScreen(),
    );
  }
}
