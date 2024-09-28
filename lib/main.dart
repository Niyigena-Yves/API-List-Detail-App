import 'package:flutter/material.dart';
import 'screens/list_view_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API List Detail App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewScreen(),
    );
  }
}