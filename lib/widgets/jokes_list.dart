import 'package:flutter/material.dart';
import 'package:labs2/models/joke_model.dart';
import 'package:labs2/widgets/joke_card.dart';

class JokesList extends StatefulWidget {
  final List<Joke> jokes;

  const JokesList({super.key, required this.jokes});

  @override
  _JokesListState createState() => _JokesListState();
}

class _JokesListState extends State<JokesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      physics: const BouncingScrollPhysics(),
      itemCount: widget.jokes.length,
      itemBuilder: (context, index) {
        final joke = widget.jokes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: JokeCard(
            punchline: joke.punchline,
            setup: joke.setup,
          ),
        );
      },
    );
  }
}
