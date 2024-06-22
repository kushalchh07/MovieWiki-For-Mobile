// ignore_for_file: dead_code_catch_following_catch

import 'dart:convert';
import 'dart:developer';

import 'package:movie_wiki/models/upcoming_moveis_model.dart';
import 'package:http/http.dart' as http;

class UpcomingMoviesRepository {
  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    try {
      int page = 1;
      String apiUrl =
          "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=$page";
      String token =
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWJjNjMyYWYyYzJjM2QwNjdhZjZkYWZkNTMzMTdkMCIsInN1YiI6IjY2NzQ1NjgzYWI3MTkyMDFiNzRlYjdiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DR05kSqw0gzg_N_IS1S02D50F_3wwPGJ3atIVMSvNeA";

      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Authorization': 'Bearer $token',
        'accept': 'application/json',
      });

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to load upcoming movies: ${response.reasonPhrase}');
      }

      final jsonData = jsonDecode(response.body);

      if (jsonData == null ||
          !jsonData.containsKey('results') ||
          jsonData['results'].isEmpty) {
        throw Exception('Failed to parse JSON response or no results found');
      }

      // log(jsonData.toString());
      return UpcomingMoviesModel.fromJson(jsonData);
    } on http.ClientException catch (e, stackTrace) {
      log('ClientException: $e', stackTrace: stackTrace);
      throw Exception('Failed to load upcoming movies: $e');
    } on FormatException catch (e, stackTrace) {
      log('FormatException: $e', stackTrace: stackTrace);
      throw Exception('Failed to load upcoming movies: $e');
    } catch (e, stackTrace) {
      log('Unknown error: $e', stackTrace: stackTrace);
      throw Exception('Failed to load upcoming movies: $e');
    }
  }
}
