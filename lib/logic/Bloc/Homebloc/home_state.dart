part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  List<Result> upcomingMoviesList;
  HomeLoadedState({required this.upcomingMoviesList});
}

final class HomeErrorState extends HomeState {}
