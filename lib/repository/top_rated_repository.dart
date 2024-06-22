import 'dart:convert';

import 'package:movie_wiki/models/top_rated_movies_model.dart';
import'package:http/http.dart' as http;


String Api = "https://api.themoviedb.org/3/movie/top_rated?language=en-US";
dynamic token =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWJjNjMyYWYyYzJjM2QwNjdhZjZkYWZkNTMzMTdkMCIsInN1YiI6IjY2NzQ1NjgzYWI3MTkyMDFiNzRlYjdiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DR05kSqw0gzg_N_IS1S02D50F_3wwPGJ3atIVMSvNeA";
class TopRatedRepository {
  Future<TopRatedMoviesModel> getTopRatedMovies() async {
    try {
      final response = await http.get(Uri.parse(Api),headers: {
        'Authorization': 'Bearer $token',
        'accept': 'application/json',
      });
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