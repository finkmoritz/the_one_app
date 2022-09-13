import 'package:flutter/material.dart';
import 'package:the_one_app/books_page.dart';

void main() {
  runApp(const TheOneApp());
}

class TheOneApp extends StatelessWidget {
  const TheOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The One App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BooksPage(),
    );
  }
}
