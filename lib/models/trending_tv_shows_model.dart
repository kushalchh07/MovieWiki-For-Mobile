class TrendingTvShowsModel {
    final int page;
    final List<Result> results;
    final int totalPages;
    final int totalResults;

    TrendingTvShowsModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

}

class Result {
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

    Result({
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

}

enum MediaType {
    TV
}
