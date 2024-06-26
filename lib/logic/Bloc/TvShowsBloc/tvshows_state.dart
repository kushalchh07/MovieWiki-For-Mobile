part of 'tvshows_bloc.dart';

@immutable
sealed class TvshowsState {}

final class TvshowsInitial extends TvshowsState {}
final class TvshowsLoadingState extends TvshowsState {}

final class TvshowsLoadedState extends TvshowsState {
  final List<Resultsss> trendingTvShowsList;
final List<Res> popularTvSeriesList;
final List<TopTv> topRatedTvSeriesList;
  TvshowsLoadedState({
    required this.topRatedTvSeriesList,
    required this.trendingTvShowsList,
    required this.popularTvSeriesList,
  });
}

final class TvshowsErrorState extends TvshowsState {}
