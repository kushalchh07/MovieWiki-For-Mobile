// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:developer';
import 'package:movie_wiki/models/recommended_anime_model.dart';

import 'package:http/http.dart' as http;
import 'package:movie_wiki/utils/rateLimiter/ratelimiter.dart';

const String api = "https://api.jikan.moe/v4/recommendations/anime";

class RecommendedAnimesRepository {
  final RateLimiter rateLimiter =
      RateLimiter(maxRequests: 3, period: Duration(seconds: 60));

  Future<RecommendedAnimeModel> getRecommendedAnimes() async {
    await rateLimiter.allowRequest();

    final response = await http.get(Uri.parse(api), headers: {
      'accept': 'application/json',
    });

    if (response.statusCode != 200)
      throw Exception(
          'Failed to load recommended animes: ${response.statusCode}');

    final jsonData = jsonDecode(response.body);

    if (jsonData == null ||
        !jsonData.containsKey('data') ||
        jsonData['data'].isEmpty)
      throw Exception('Failed to parse JSON response or no results found');

    return RecommendedAnimeModel.fromJson(jsonData);
  }
}
