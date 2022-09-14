import 'package:flutter/material.dart';
import 'package:lotr_api/lotr_api.dart';
import 'package:the_one_app/main.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: FutureBuilder(
        future: LotrApi(
          apiKey: apiKey,
        ).getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<Movie> movies = snapshot.data?.docs ?? [];
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(movies[index].name),
                subtitle: Text(
                  'Oscars: ${movies[index].academyAwardWins} (${movies[index].academyAwardNominations}), Rotten Tomatoes: ${movies[index].rottenTomatoesScore.round()}%',
                ),
                trailing: Text('${movies[index].runtimeInMinutes} min'),
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
