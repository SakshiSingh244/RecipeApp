import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(SimpleRecipeApp());
}

class SimpleRecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
