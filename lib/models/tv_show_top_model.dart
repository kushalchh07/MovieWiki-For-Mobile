import 'dart:convert';

class TopRatedTvShowsModel {
  final int page;
  final List<TopTv> results;
  final int totalPages;
  final int totalResults;

  TopRatedTvShowsModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRatedTvShowsModel.fromJson(Map<String, dynamic> json) {
    return TopRatedTvShowsModel(
      page: json['page'],
      results: List<TopTv>.from(json['results'].map((x) => TopTv.fromJson(x))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': List<dynamic>.from(results.map((x) => x.toJson())),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

class TopTv {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final List<OriginCountry> originCountry;
  final OriginalLanguage originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  TopTv({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TopTv.fromJson(Map<String, dynamic> json) {
    return TopTv(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      id: json['id'],
      originCountry: List<OriginCountry>.from(
          json['origin_country'].map((x) => originCountryValues.map[x]!)),
      originalLanguage: originalLanguageValues.map[json['original_language']]!,
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      firstAirDate: DateTime.parse(json['first_air_date']),
      name: json['name'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
      'id': id,
      'origin_country': List<dynamic>.from(
          originCountry.map((x) => originCountryValues.reverse[x])),
      'original_language': originalLanguageValues.reverse[originalLanguage],
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'first_air_date':
          "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
      'name': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}

enum OriginCountry { CA, JP, KR, US }

final originCountryValues = EnumValues({
  'CA': OriginCountry.CA,
  'JP': OriginCountry.JP,
  'KR': OriginCountry.KR,
  'US': OriginCountry.US,
});

enum OriginalLanguage { EN, JA, KO }

final originalLanguageValues = EnumValues({
  'en': OriginalLanguage.EN,
  'ja': OriginalLanguage.JA,
  'ko': OriginalLanguage.KO,
});

class EnumValues<T> {
  final Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
