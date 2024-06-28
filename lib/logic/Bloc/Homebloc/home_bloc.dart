// ignore_for_file: empty_catches, dead_code

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/logic/Bloc/Homebloc/home_state.dart';
import 'package:movie_wiki/models/upcoming_moveis_model.dart';
import 'package:movie_wiki/repository/top_animes_repository.dart';
import 'package:movie_wiki/repository/top_rated_repository.dart';
import 'package:movie_wiki/repository/trending_movies_repository.dart';
import 'package:movie_wiki/repository/trending_tv_shows_repository.dart';
import 'package:movie_wiki/repository/upcoming_movies_repository.dart';

import '../../../repository/trending_now.dart';

part 'home_event.dart';
// part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeLoadEvent>(_homeLoadEvent);
  }

  FutureOr<void> _homeLoadEvent(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoadingState());

      final upcomingMoviesRepository = UpcomingMoviesRepository();
      final trendingTvShowsRepository = TrendingTvShowsRepository();
      final trendingAllRepository = TrendingAllRepository();

      final upcomingMovies = await upcomingMoviesRepository.getUpcomingMovies();
      final trendingTvShows = await trendingTvShowsRepository.getTrendingTvShows();
      final trendingAll = await trendingAllRepository.getTrendingAll();

      log(upcomingMovies.toString());
      log(trendingAll.toString());

      if (upcomingMovies == null ||
          trendingTvShows == null ||
          trendingAll == null) {
        throw Exception('Failed to load response: Response is null');
      }

      final upcomingMoviesList = upcomingMovies.results ?? [];
      final trendingTvShowsList = trendingTvShows.results ?? [];
      final trendingAllList = trendingAll.results ?? [];

      if (upcomingMoviesList.isEmpty ||
          trendingTvShowsList.isEmpty ||
          trendingAllList.isEmpty) {
        throw Exception(
          'Failed to load one of movies loading failed: "results" field is empty',
        );
      }
      log(trendingAllList.toString());
      emit(
        HomeLoadedState(
          allTrendingList: trendingAllList,
          upcomingMoviesList: upcomingMoviesList,
          trendingTvShowsList: trendingTvShowsList,
        ),
      );
    } catch (e, stackTrace) {
      log('Failed to load movies: $e');
      log('StackTrace: $stackTrace');
      emit(HomeErrorState(error: 'Failed to load movies: $e'));
    }
  }
}
