import 'package:flutter/material.dart';
import 'package:lotr_api/lotr_api.dart';
import 'package:the_one_app/main.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: FutureBuilder(
        future: LotrApi(
          apiKey: apiKey,
        ).getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<Quote> quotes = snapshot.data?.docs ?? [];
            return ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) => ListTile(
                title: Text('"${quotes[index].dialog}"'),
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
