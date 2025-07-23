import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/Home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevPortfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF1a1a2e),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
