import 'dart:convert';

Joke jokeFromJson(String str) => Joke.fromJson(json.decode(str));

class Joke {
  final String type;
  final String setup;
  final String punchline;
  final int id;

  Joke(
      {required this.type,
      required this.setup,
      required this.punchline,
      required this.id});

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        type: json["type"] ?? '',
        setup: json["setup"] ?? '',
        punchline: json["punchline"] ?? '',
        id: json["id"] ?? -1,
      );

  @override
  String toString() {
    return "id: $id, type: $type, setup: $setup, punchline: $punchline";
  }
}
