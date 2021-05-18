import 'package:flutter/material.dart';
import 'file:///C:/FlutterIteratorPatternDemo/flutter_iterator_pattern_demo/lib/home/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
