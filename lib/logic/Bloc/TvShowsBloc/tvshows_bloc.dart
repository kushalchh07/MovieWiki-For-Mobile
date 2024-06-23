import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/trending_tv_shows_model.dart';
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
      dynamic trendingTvShows =
          await trendingTvShowsRepository.getTrendingTvShows();

      if (trendingTvShows == null) {
        throw Exception('Failed to load response: Response is null');
      }

      final trendingTvShowsList = trendingTvShows.results;

      if (trendingTvShows == null) {
        emit(TvshowsErrorState());
      }

      emit(TvshowsLoadedState(trendingTvShowsList: trendingTvShowsList));
    } catch (e) {
      emit(TvshowsErrorState());
    }
  }
}
