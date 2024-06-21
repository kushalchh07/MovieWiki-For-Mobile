class UpcomingMoviesModel {
    final Dates dates;
    final int page;
    final List<Result> results;
    final int totalPages;
    final int totalResults;

    UpcomingMoviesModel({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

}

class Dates {
    final DateTime maximum;
    final DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

}

class Result {
    final bool adult;
    final String backdropPath;
    final List<int> genreIds;
    final int id;
    final OriginalLanguage originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String posterPath;
    final DateTime releaseDate;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

    Result({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

}

enum OriginalLanguage {
    EN,
    JA,
    TL,
    ZH
}
