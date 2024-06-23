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

part 'home_event.dart';
// part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeLoadEvent>(_homeLoadEvent);
  }

  FutureOr<void> _homeLoadEvent(
      HomeLoadEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      UpcomingMoviesRepository upcomingMoviesRepository =
          UpcomingMoviesRepository();

      TrendingMoviesRepository trendingMoviesRepository =
          TrendingMoviesRepository();

      TrendingTvShowsRepository trendingTvShowsRepository =
          TrendingTvShowsRepository();

      TopRatedRepository topRatedRepository = TopRatedRepository();

      // TopAnimesRepository topAnimesRepository = TopAnimesRepository();

      dynamic upcomingMovies =
          await upcomingMoviesRepository.getUpcomingMovies();

      dynamic trendingMoveis =
          await trendingMoviesRepository.getTrendingMovies();

      dynamic trendingTvShows =
          await trendingTvShowsRepository.getTrendingTvShows();

      dynamic topRatedMovies = await topRatedRepository.getTopRatedMovies();

      // dynamic topAnimes = await topAnimesRepository.getTopAnimes();

      if (upcomingMovies == null ||
          trendingMoveis == null ||
          trendingTvShows == null ||
          topRatedMovies == null 
          // ||
          // topAnimes == null
          ) {
        throw Exception('Failed to load response: Response is null');
      }

      final upcomingMoviesList = upcomingMovies.results;
      final trendingMoviesList = trendingMoveis.results;
      final trendingTvShowsList = trendingTvShows.results;
      final topRatedMoviesList = topRatedMovies.results;
      // final topAnimesList = topAnimes.data;
// log (topAnimesList.toString());
      if (upcomingMoviesList == null ||
          upcomingMoviesList.isEmpty ||
          trendingMoviesList == null ||
          trendingMoviesList.isEmpty ||
          trendingTvShowsList == null ||
          trendingTvShowsList.isEmpty ||
          topRatedMoviesList == null ||
          topRatedMoviesList.isEmpty
          //  ||
          // topAnimesList == null ||
          // topAnimesList.isEmpty
          ) {

        throw Exception(
            'Failed to load one of movies loading failed: "results" field is null');
        log('Failed to load one of movies loading failed: "results" field is null');
      }
      // log(upcomingMoviesList.toString());
      emit(HomeLoadedState(
          trendingMoviesList: trendingMoviesList,
          upcomingMoviesList: upcomingMoviesList,
          topRatedMoviesList: topRatedMoviesList,
          trendingTvShowsList: trendingTvShowsList,
          // topAnimesList: topAnimesList
          // .map((jsonData) => UpcomingMoviesModel.fromJson(jsonData))
          // .toList(),
          ));
    } 
    catch (e) {
      if (e is Exception) {

        log(e.toString());
        throw Exception('Failed to load $e movies: $e');
      } else {
        rethrow;
      }
    }
  }
}
