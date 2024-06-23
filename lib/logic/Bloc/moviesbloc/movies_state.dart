part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoadingState extends MoviesState {}

final class MoviesLoadedState extends MoviesState {
  final List<Result> upcomingMoviesList;
  final List<Results> trendingMoviesList;

  final List<Resultss> topRatedMoviesList;
  // final List<TopAnimesModel> topAnimes;  //TODO: Add top animes

  MoviesLoadedState({
    required this.upcomingMoviesList,
    required this.trendingMoviesList,
    required this.topRatedMoviesList,
    // required this.topAnimes,
  });
}

final class MoviesErrorState extends MoviesState {}
