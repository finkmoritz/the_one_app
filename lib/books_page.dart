import 'package:flutter/material.dart';
import 'package:lotr_api/lotr_api.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: FutureBuilder(
        future: LotrApi().getBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<Book> books = snapshot.data?.docs ?? [];
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(books[index].name),
              ),
            );
          }
          return const Center(
            child: Text('Loading...'),
          );
        },
      ),
    );
  }
}
