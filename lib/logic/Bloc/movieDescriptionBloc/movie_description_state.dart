part of 'movie_description_bloc.dart';

@immutable
sealed class MovieDescriptionState {}

final class MovieDescriptionInitial extends MovieDescriptionState {}


final class MovieDescriptionLoadingState extends MovieDescriptionState {}

final class MovieDescriptionLoadedState extends MovieDescriptionState {
  final UpcomingMoviesModel movieDescriptionModel;
  MovieDescriptionLoadedState(this.movieDescriptionModel);
}

final class MovieDescriptionErrorState extends MovieDescriptionState {
  final String message;
  MovieDescriptionErrorState(this.message);
}
