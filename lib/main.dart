import 'package:flutter/material.dart';
import 'package:the_one_app/home_page.dart';

const String apiKey = ''; // TODO add TheOneApi API key here

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
      home: const HomePage(),
    );
  }
}
