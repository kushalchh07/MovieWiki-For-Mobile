import 'dart:convert';

class AllTrendingModel {
  final int page;
  final List<AllTrend> results;
  final int totalPages;
  final int totalResults;

  AllTrendingModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory AllTrendingModel.fromJson(Map<String, dynamic> json) {
    try {
      final resultsList = json['results'] as List<dynamic>;
      List<AllTrend> results = resultsList.map((e) => AllTrend.fromJson(e)).toList();

      return AllTrendingModel(
        page: json['page'],
        results: results,
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
    } catch (e, stackTrace) {
      print('Error parsing AllTrendingModel from JSON: $e');
      print('StackTrace: $stackTrace');
      rethrow;
    }
  }
}

class AllTrend {
  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final MediaType mediaType;
  final bool adult;
  final OriginalLanguage originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime? releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String name;
  final String originalName;
  final DateTime? firstAirDate;
  final List<String> originCountry;

  AllTrend({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.name,
    required this.originalName,
    required this.firstAirDate,
    required this.originCountry,
  });

  factory AllTrend.fromJson(Map<String, dynamic> json) {
    return AllTrend(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: _parseMediaType(json['media_type']),
      adult: json['adult'] ?? false,
      originalLanguage: _parseOriginalLanguage(json['original_language']),
      genreIds: json['genre_ids'] != null ? List<int>.from(json['genre_ids']) : [],
      popularity: json['popularity'] ?? 0.0,
      releaseDate: json['release_date'] != null ? DateTime.parse(json['release_date']) : null,
      video: json['video'] ?? false,
      voteAverage: json['vote_average'] ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      firstAirDate: json['first_air_date'] != null ? DateTime.parse(json['first_air_date']) : null,
      originCountry: json['origin_country'] != null ? List<String>.from(json['origin_country']) : [],
    );
  }

  static MediaType _parseMediaType(String? mediaType) {
    switch (mediaType) {
      case 'movie':
        return MediaType.MOVIE;
      case 'tv':
        return MediaType.TV;
      default:
        return MediaType.MOVIE; // Default to movie if unknown
    }
  }

  static OriginalLanguage _parseOriginalLanguage(String? originalLanguage) {
    switch (originalLanguage) {
      case 'en':
        return OriginalLanguage.EN;
      case 'es':
        return OriginalLanguage.ES;
      case 'ja':
        return OriginalLanguage.JA;
      case 'te':
        return OriginalLanguage.TE;
      default:
        return OriginalLanguage.EN; // Default to English if unknown
    }
  }
}

enum MediaType {
  MOVIE,
  TV,
}

enum OriginalLanguage {
  EN,
  ES,
  JA,
  TE,
}
