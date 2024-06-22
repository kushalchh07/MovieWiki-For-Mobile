// ignore_for_file: empty_catches, dead_code

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/upcoming_moveis_model.dart';
import 'package:movie_wiki/repository/upcoming_movies_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

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
      dynamic upcomingMovies =
          await upcomingMoviesRepository.getUpcomingMovies();
      if (upcomingMovies == null) {
        throw Exception('Failed to load upcoming movies: Response is null');
      }
      // List<dynamic> upcomingMoviesList = upcomingMovies["results"];

      final upcomingMoviesList = upcomingMovies.results;
      if (upcomingMoviesList == null) {
        throw Exception(
            'Failed to load upcoming movies: "results" field is null');
        log('Failed to load upcoming movies: "results" field is null');
      }
      // log(upcomingMoviesList.toString());
      emit(HomeLoadedState(upcomingMoviesList: upcomingMoviesList
          // .map((jsonData) => UpcomingMoviesModel.fromJson(jsonData))
          // .toList(),
          ));
    } catch (e) {
      if (e is Exception) {
        log(e.toString());
        throw Exception('Failed to load upcoming movies: $e');
      } else {
        rethrow;
      }
    }
  }
}
