import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/popular_tv_series_model.dart';
import 'package:movie_wiki/models/trending_tv_shows_model.dart';
import 'package:movie_wiki/repository/popular_tv_series_repository.dart';
import 'package:movie_wiki/repository/trending_tv_shows_repository.dart';
import 'package:movie_wiki/repository/tv_show_toprated_repository.dart';

import '../../../models/tv_show_top_model.dart';

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
      TopRatedTvSeriesRepository topRatedRepository =
          TopRatedTvSeriesRepository();
      dynamic trendingTvShows =
          await trendingTvShowsRepository.getTrendingTvShows();

      dynamic popularTvSeries =
          await popularTvSeriesRepository.getPopularTvSeries();

      dynamic topRatedSeries = await topRatedRepository.getTopRatedTvSeries();

      if (trendingTvShows == null ||
          popularTvSeries == null ||
          topRatedSeries == null) {
        throw Exception('Failed to load response: Response is null');
      }

      final trendingTvShowsList = trendingTvShows.results;
      final popularTvSeriesList = popularTvSeries.results;
      final topRatedSeriesList = topRatedSeries.results;

      // log(popularTvSeriesList.toString());
      //       log(trendingTvShowsList.toString());
      // log(topRatedSeriesList.toString());

      if (trendingTvShows == null ||
          popularTvSeries == null ||
          topRatedSeries == null) {
        emit(TvshowsErrorState());
      }

      emit(TvshowsLoadedState(
          topRatedTvSeriesList: topRatedSeriesList,
          popularTvSeriesList: popularTvSeriesList,
          trendingTvShowsList: trendingTvShowsList));
    } catch (e) {
      emit(TvshowsErrorState());
    }
  }
}
