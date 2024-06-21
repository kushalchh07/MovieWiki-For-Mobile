// ignore_for_file: dead_code_catch_following_catch

import 'dart:convert';

import 'package:movie_wiki/models/upcoming_moveis_model.dart';
import'package:http/http.dart' as http;

String Api = "https://api.themoviedb.org/3/movie/upcoming?language=en-US";
class UpcomingMoviesRepository {
  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    try {
      final response = await http.get(Uri.parse(Api));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData == null) {
          throw Exception('Failed to parse JSON response');
        } else {
          return UpcomingMoviesModel.fromJson(jsonData);
        }
      } else {
        throw Exception('Failed to load upcoming movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load upcoming movies: $e');
    } catch (e, stackTrace) {
      print(stackTrace);
      throw Exception('Failed to load upcoming movies: $e');
    }
  }
}