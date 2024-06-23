// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/top_rated_movies_model.dart';
import 'package:movie_wiki/models/trending_movies_model.dart';
import 'package:movie_wiki/models/upcoming_moveis_model.dart';
import 'package:movie_wiki/repository/top_rated_repository.dart';
import 'package:movie_wiki/repository/trending_movies_repository.dart';
import 'package:movie_wiki/repository/upcoming_movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<LoadMoviesEvent>(_loadMoviesEvent);
  }

  FutureOr<void> _loadMoviesEvent(
      LoadMoviesEvent event, Emitter<MoviesState> emit) async {
    try {
      emit(MoviesLoadingState());

      UpcomingMoviesRepository upcomingMoviesRepository =
          UpcomingMoviesRepository();

      TrendingMoviesRepository trendingMoviesRepository =
          TrendingMoviesRepository();
      TopRatedRepository topRatedRepository = TopRatedRepository();

      dynamic upcomingMovies =
          await upcomingMoviesRepository.getUpcomingMovies();

      dynamic trendingMoveis =
          await trendingMoviesRepository.getTrendingMovies();

      dynamic topRatedMovies = 
      await topRatedRepository.getTopRatedMovies();


      if (upcomingMovies == null ||
          trendingMoveis == null ||
          
          topRatedMovies == null 
         
          ) {
        throw Exception('Failed to load response: Response is null');
      }

      final upcomingMoviesList = upcomingMovies.results;
      final trendingMoviesList = trendingMoveis.results;
      final topRatedMoviesList = topRatedMovies.results;

      if (upcomingMovies == null ||
          trendingMoveis == null ||
          topRatedMovies == null) {
        emit(MoviesErrorState());
      } 

      emit(MoviesLoadedState(
          upcomingMoviesList: upcomingMoviesList,
          trendingMoviesList: trendingMoviesList,
          topRatedMoviesList: topRatedMoviesList));
    } catch (e) {
       if (e is Exception) {

        log(e.toString());
        throw Exception('Failed to load $e movies: $e');
      } else {
        rethrow;
      }
    }
  }
}
