import 'package:app_one/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABC Genius',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}
