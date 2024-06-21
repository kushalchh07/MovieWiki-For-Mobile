import 'dart:convert';

import 'package:movie_wiki/models/top_anime_model.dart';
import 'package:http/http.dart' as http;
String api = "https://api.jikan.moe/v4/top/anime";

class TopAnimesRepository {
  Future<TopAnimesModel> getTopAnimes() async {
    try {
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        final responseBody = response.body;
        if (responseBody == null) {
          throw Exception('Response body is null');
        }
        final jsonData = jsonDecode(responseBody);
        if (jsonData == null) {
          throw Exception('Failed to parse JSON response');
        }
        return TopAnimesModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load top animes: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to load top animes: $e');
      } else {
        throw Exception('Failed to load top animes: Unknown error');
      }
    }
  }
}
