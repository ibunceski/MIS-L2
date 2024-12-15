import 'package:flutter/material.dart';
import 'package:labs2/screens/random_joke_screen.dart';
import 'package:labs2/widgets/types_list.dart';
import 'dart:convert';
import '../services/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String>? types;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTypesOfJokes();
  }

  void getTypesOfJokes() async {
    setState(() {
      isLoading = true;
    });
    try {
      String response = await ApiService.getJokeTypes();
      setState(() {
        types = List<String>.from(json.decode(response));
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
          "Joke App - 221094",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.casino),
            tooltip: "Random Joke",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RandomJoke(),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : types != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TypesList(types: types!),
                  ),
                )
              : const Center(
                  child: Text(
                    "Failed to load joke types. Please try again later.",
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
