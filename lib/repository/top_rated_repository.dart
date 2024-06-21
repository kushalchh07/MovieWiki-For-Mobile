import 'dart:convert';

import 'package:movie_wiki/models/top_rated_movies_model.dart';
import'package:http/http.dart' as http;


String Api = "https://api.themoviedb.org/3/movie/top_rated?language=en-US";

class TopRatedRepository {
  Future<TopRatedMoviesModel> getTopRatedMovies() async {
    try {
      final response = await http.get(Uri.parse(Api));
      if (response.statusCode == 200) {
        final responseBody = response.body;
        if (responseBody == null) {
          throw Exception('Response body is null');
        }
        final jsonData = jsonDecode(responseBody);
        if (jsonData == null) {
          throw Exception('Failed to parse JSON response');
        }
        return TopRatedMoviesModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load top rated movies: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to load top rated movies: $e');
      } else {
        throw Exception('Failed to load top rated movies: Unknown error');
      }
    }
  }
}