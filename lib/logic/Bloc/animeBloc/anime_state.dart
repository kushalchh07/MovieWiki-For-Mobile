part of 'anime_bloc.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}

final class AnimeLoadingState extends AnimeState {}

final class AnimeLoadedState extends AnimeState {
  final List<TopAnime> topAnimesList;
  final List<Datum> topMangaList;
  final List<dynamic> recommendedAnimesList;
  AnimeLoadedState({required this.topAnimesList, required this.topMangaList, required this.recommendedAnimesList});
}

final class AnimeErrorState extends AnimeState {
  final String error;
  AnimeErrorState({required this.error});
}
