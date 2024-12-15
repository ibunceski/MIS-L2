import 'package:flutter/material.dart';
import 'package:labs2/widgets/joke_card.dart';
import 'package:labs2/models/joke_model.dart';
import 'package:labs2/services/api_service.dart';

class RandomJoke extends StatefulWidget {
  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  Joke? joke;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRandomJokeFromApi();
  }

  void getRandomJokeFromApi() async {
    setState(() {
      isLoading = true;
    });
    try {
      String response = await ApiService.getRandomJoke();
      setState(() {
        joke = jokeFromJson(response);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Random Joke - 221094",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.teal,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : joke != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: JokeCard(
                        setup: joke!.setup,
                        punchline: joke!.punchline,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: getRandomJokeFromApi,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text("Next"),
                    ),
                  ],
                )
              : const Center(
                  child: Text(
                    "Failed to load a joke. Please try again later.",
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
