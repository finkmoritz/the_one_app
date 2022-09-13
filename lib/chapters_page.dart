import 'package:flutter/material.dart';
import 'package:lotr_api/lotr_api.dart';

class ChaptersPage extends StatefulWidget {
  final Book book;

  const ChaptersPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<ChaptersPage> createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.name),
      ),
      body: FutureBuilder(
        future: LotrApi().getBookChapters(
          bookId: widget.book.id,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<Chapter> chapters = snapshot.data?.docs ?? [];
            return ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(chapters[index].chapterName),
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
