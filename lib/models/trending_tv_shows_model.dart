import 'dart:convert';

class TrendingTvShowsModel {
  final int page;
  final List<Resultsss> results;
  final int totalPages;
  final int totalResults;

  TrendingTvShowsModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingTvShowsModel.fromJson(Map<String, dynamic> json) {
    return TrendingTvShowsModel(
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>?)
              ?.map((x) => Resultsss.fromJson(x))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((x) => x.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

class Resultsss {
  final String backdropPath;
  final int id;
  final String originalName;
  final String overview;
  final String posterPath;
  final MediaType mediaType;
  final bool adult;
  final String name;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime firstAirDate;
  final double voteAverage;
  final int voteCount;
  final List<String> originCountry;

  Resultsss({
    required this.backdropPath,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.name,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });

  factory Resultsss.fromJson(Map<String, dynamic> json) {
    return Resultsss(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: MediaType.values.firstWhere(
        (e) => e.toString() == 'MediaType.${json['media_type']}',
        orElse: () => MediaType.TV,
      ),
      adult: json['adult'] ?? false,
      name: json['name'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((x) => x as int)
              .toList() ??
          [],
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      firstAirDate: DateTime.tryParse(json['first_air_date'] ?? '') ??
          DateTime.now(),
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      originCountry: (json['origin_country'] as List<dynamic>?)
              ?.map((x) => x as String)
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType.toString().split('.').last,
      'adult': adult,
      'name': name,
      'original_language': originalLanguage,
      'genre_ids': genreIds.map((x) => x).toList(),
      'popularity': popularity,
      'first_air_date': firstAirDate.toIso8601String(),
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'origin_country': originCountry.map((x) => x).toList(),
    };
  }
}

enum MediaType { TV }
