import 'package:animal_explain_app/src/pages/detail_page.dart';
import 'package:animal_explain_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'detail': (BuildContext context) => DetailPage(),
      },
    );
  }
}
