import 'package:flutter/material.dart';
import 'package:labs2/screens/home_screen.dart';
import 'package:labs2/screens/jokes_screen.dart';
import 'package:labs2/screens/random_joke_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jokes',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Home(),
          '/random': (context) => const RandomJoke(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/jokes') {
            final String type = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => Jokes(type: type),
            );
          }
          return null;
        });
  }
}
