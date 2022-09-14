import 'package:flutter/material.dart';
import 'package:the_one_app/characters_page.dart';
import 'package:the_one_app/quotes_page.dart';

import 'books_page.dart';
import 'movies_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The One App'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Books'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BooksPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Movies'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MoviesPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Characters'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CharactersPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Quotes'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuotesPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
