import 'dart:convert';

import 'package:movie_wiki/models/trending_tv_shows_model.dart';
import'package:http/http.dart' as http;

String Api = "https://api.themoviedb.org/3/trending/tv/day?language=en-US";
class TrendingTvShowsRepository {
  Future<TrendingTvShowsModel> getTrendingTvShows() async {
    try {
      final response = await http.get(Uri.parse(Api));
      if (response.statusCode == 200) {
        final body = response.body;
        if (body != null) {
          final jsonData = jsonDecode(body);
          if (jsonData != null) {
            return TrendingTvShowsModel.fromJson(jsonData);
          } else {
            throw Exception('Failed to parse JSON response');
          }
        } else {
          throw Exception('Response body is null');
        }
      } else {
        throw Exception('Failed to load trending tv shows: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to load trending tv shows: $e');
      } else {
        throw Exception('Failed to load trending tv shows: Unknown error');
      }
    }
  }
}