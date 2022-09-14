import 'package:flutter/material.dart';
import 'package:lotr_api/lotr_api.dart';
import 'package:the_one_app/main.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: FutureBuilder(
        future: LotrApi(
          apiKey: apiKey,
        ).getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<Character> characters = snapshot.data?.docs ?? [];
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) => ListTile(
                isThreeLine: true,
                title: Text(characters[index].name),
                subtitle: Text('Birth: ${characters[index].birth}\nDeath: ${characters[index].death}'),
                trailing: Text('${characters[index].gender} ${characters[index].race}'),
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
