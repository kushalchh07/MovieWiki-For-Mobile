part of 'tvshows_bloc.dart';

@immutable
sealed class TvshowsState {}

final class TvshowsInitial extends TvshowsState {}
final class TvshowsLoadingState extends TvshowsState {}

final class TvshowsLoadedState extends TvshowsState {
  final List<Resultsss> trendingTvShowsList;

  TvshowsLoadedState({
    required this.trendingTvShowsList,
  });
}

final class TvshowsErrorState extends TvshowsState {}
