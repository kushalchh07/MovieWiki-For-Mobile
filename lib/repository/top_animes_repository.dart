import 'dart:convert';
import 'dart:developer';
import 'package:movie_wiki/models/top_anime_model.dart';
import 'package:http/http.dart' as http;

const String api = "https://api.jikan.moe/v4/top/anime";

class TopAnimesRepository {
  Future<TopAnimesModel> getTopAnimes() async {
    try {
      final response = await http.get(Uri.parse(api), headers: {
        'accept': 'application/json',
      });

if(response.statusCode != 200)
{
throw Exception('Failed to load top animes: ${response.statusCode}');
}
final jsonData =jsonDecode(response.body);

if(jsonData == null || !jsonData.containsKey('data') || jsonData['data'].isEmpty)
{
          throw Exception('Failed to parse JSON response or no results found');

}
return TopAnimesModel.fromJson(jsonData);
     
    } on http.ClientException catch (e, stackTrace) {
      // Log the error and re-throw it
      log('ClientException: $e', stackTrace: stackTrace);
      throw Exception('Failed to load Top Animes : $e');
    } on FormatException catch (e, stackTrace) {
      // Log the error and re-throw it
      log('FormatException: $e', stackTrace: stackTrace);
      throw Exception('Failed to load Top Animes : $e');
    } catch (e, stackTrace) {
      // Log the error and re-throw it
      log('Unknown error: $e', stackTrace: stackTrace);
      throw Exception('Failed to load Top Animes : $e');
    }
  }
}
