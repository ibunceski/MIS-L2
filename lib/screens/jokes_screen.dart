import 'package:flutter/material.dart';
import 'package:labs2/models/joke_model.dart';
import 'package:labs2/widgets/jokes_list.dart';
import '../services/api_service.dart';
import 'dart:convert';

class Jokes extends StatefulWidget {
  final String type;

  const Jokes({super.key, required this.type});

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  List<Joke>? jokes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getJokesFromType(widget.type);
  }

  getJokesFromType(String type) async {
    setState(() {
      isLoading = true;
    });
    try {
      String response =
          (await ApiService.getJokesByType(type)).replaceAll("\n", "");
      setState(() {
        var data = List.from(json.decode(response));
        jokes = data.map((e) => Joke.fromJson(e)).toList();
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
          "Jokes - 221094",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : jokes != null
              ? JokesList(
                  jokes: jokes!,
                )
              : const Center(
                  child: Text(
                    "Failed to load fetch the jokes. Please try again later.",
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
