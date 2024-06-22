import 'dart:convert';

import 'package:movie_wiki/models/trending_movies_model.dart';
import'package:http/http.dart' as http;

String Api = "https://api.themoviedb.org/3/trending/movie/day?language=en-US";
dynamic token =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWJjNjMyYWYyYzJjM2QwNjdhZjZkYWZkNTMzMTdkMCIsInN1YiI6IjY2NzQ1NjgzYWI3MTkyMDFiNzRlYjdiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DR05kSqw0gzg_N_IS1S02D50F_3wwPGJ3atIVMSvNeA";
class TrendingMoviesRepository {
  Future<TrendingMoviesModel> getTrendingMovies() async {
    try {
      final response = await http.get(Uri.parse(Api));
      if (response.statusCode == 200) {
        final body = response.body;
        if (body != null) {
          final jsonData = jsonDecode(body);
          if (jsonData != null) {
            return TrendingMoviesModel.fromJson(jsonData);
          } else {
            throw Exception('Failed to parse JSON response');
          }
        } else {
          throw Exception('Response body is null');
        }
      } else {
        throw Exception('Failed to load trending movies: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to load trending movies: $e');
      } else {
        throw Exception('Failed to load trending movies: Unknown error');
      }
    }
  }
}