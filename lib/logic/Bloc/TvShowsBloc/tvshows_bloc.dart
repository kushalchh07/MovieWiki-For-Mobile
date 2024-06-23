import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/popular_tv_series_model.dart';
import 'package:movie_wiki/models/trending_tv_shows_model.dart';
import 'package:movie_wiki/repository/popular_tv_series_repository.dart';
import 'package:movie_wiki/repository/trending_tv_shows_repository.dart';

part 'tvshows_event.dart';
part 'tvshows_state.dart';

class TvshowsBloc extends Bloc<TvshowsEvent, TvshowsState> {
  TvshowsBloc() : super(TvshowsInitial()) {
    on<LoadTvshowsEvent>(_tvshowsTappedEvent);
  }

  FutureOr<void> _tvshowsTappedEvent(
      LoadTvshowsEvent event, Emitter<TvshowsState> emit) async {
    emit(TvshowsLoadingState());

    try {
      TrendingTvShowsRepository trendingTvShowsRepository =
          TrendingTvShowsRepository();

      PopularTvSeriesRepository popularTvSeriesRepository =
          PopularTvSeriesRepository();
      dynamic trendingTvShows =
          await trendingTvShowsRepository.getTrendingTvShows();

      dynamic popularTvSeries =
          await popularTvSeriesRepository.getPopularTvSeries();

      if (trendingTvShows == null || popularTvSeries == null) {
        throw Exception('Failed to load response: Response is null');
      }

      final trendingTvShowsList = trendingTvShows.results;
      final popularTvSeriesList = popularTvSeries.results;
      
      log(popularTvSeriesList.toString());
      if (trendingTvShows == null || popularTvSeries == null) {
        emit(TvshowsErrorState());
      }

      emit(TvshowsLoadedState(
          popularTvSeriesList: popularTvSeriesList,
          trendingTvShowsList: trendingTvShowsList));
    } catch (e) {
      emit(TvshowsErrorState());
    }
  }
}
