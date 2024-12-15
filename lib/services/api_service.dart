import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> getJokeTypes() async {
    final response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/types"));
    return response.body;
  }

  static Future<String> getJokesByType(String type) async {
    final response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    return response.body;
  }

  static Future<String> getRandomJoke() async {
    final response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    return response.body;
  }
}
