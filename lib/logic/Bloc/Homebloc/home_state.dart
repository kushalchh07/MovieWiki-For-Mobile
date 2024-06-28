// import 'package:equatable/equatable.dart';
import 'package:movie_wiki/models/top_anime_model.dart';
import 'package:movie_wiki/models/top_rated_movies_model.dart';
import 'package:movie_wiki/models/trending_movies_model.dart';
import 'package:movie_wiki/models/trending_tv_shows_model.dart';
import 'package:movie_wiki/models/upcoming_moveis_model.dart';

import '../../../models/trending_all_model.dart';

abstract class HomeState {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Result> upcomingMoviesList;
  final List<AllTrend> allTrendingList;

  final List<Resultsss> trendingTvShowsList;

  const HomeLoadedState({
    required this.upcomingMoviesList,
    required this.allTrendingList,
    required this.trendingTvShowsList,
  });

  @override
  List<Object?> get props => [
        upcomingMoviesList,
        allTrendingList,
        trendingTvShowsList,
      ];
}

class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
