import 'dart:convert';

import 'package:movie_wiki/models/popular_tv_series_model.dart';
import 'package:movie_wiki/models/top_rated_movies_model.dart';
import 'package:movie_wiki/models/trending_tv_shows_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_wiki/models/tv_show_top_model.dart';

class TopRatedTvSeriesRepository {
  Future<TopRatedTvShowsModel> getTopRatedTvSeries() async {
    int page = 1;
    String Api =
        "https://api.themoviedb.org/3/tv/top_rated?language=en-US&page=$page";
    dynamic token =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWJjNjMyYWYyYzJjM2QwNjdhZjZkYWZkNTMzMTdkMCIsInN1YiI6IjY2NzQ1NjgzYWI3MTkyMDFiNzRlYjdiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DR05kSqw0gzg_N_IS1S02D50F_3wwPGJ3atIVMSvNeA";
    try {
      final response = await http.get(Uri.parse(Api), headers: {
        'Authorization': 'Bearer $token',
        'accept': 'application/json',
      });
      if (response.statusCode == 200) {
        final body = response.body;
        if (body != null) {
          final jsonData = jsonDecode(body);
          if (jsonData != null) {
            return TopRatedTvShowsModel.fromJson(jsonData);
          } else {
            throw Exception('Failed to parse JSON response');
          }
        } else {
          throw Exception('Response body is null');
        }
      } else {
        throw Exception(
            'Failed to load top Rated tv shows: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to load Top rated tv shows: $e');
      } else {
        throw Exception('Failed to load Top Rated tv shows: Unknown error');
      }
    }
  }
}
