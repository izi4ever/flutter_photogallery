import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Photogallery',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          foregroundColor: Colors.black,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          circularTrackColor: Colors.black,
          color: Colors.grey[300],
        ),
      ),
      home: HomePage(),
    );
  }
}