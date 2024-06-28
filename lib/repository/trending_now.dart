import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movie_wiki/models/trending_all_model.dart';

const String apiUrl = "https://api.themoviedb.org/3/trending/all/day?language=en-US";
const String token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWJjNjMyYWYyYzJjM2QwNjdhZjZkYWZkNTMzMTdkMCIsInN1YiI6IjY2NzQ1NjgzYWI3MTkyMDFiNzRlYjdiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DR05kSqw0gzg_N_IS1S02D50F_3wwPGJ3atIVMSvNeA";

class TrendingAllRepository {
  Future<AllTrendingModel> getTrendingAll() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
        },
      );

      log('HTTP response status: ${response.statusCode}');
      log('HTTP response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return AllTrendingModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load trending all: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e, stackTrace) {
      log('Exception caught in getTrendingAll: $e');
      log('StackTrace: $stackTrace');
      throw Exception('Failed to load trending all: $e');
    }
  }
}
