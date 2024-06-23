part of 'anime_bloc.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}

final class AnimeLoadingState extends AnimeState {}

final class AnimeLoadedState extends AnimeState {
  final List<TopAnime> topAnimesList;
   AnimeLoadedState({required this.topAnimesList});
}

final class AnimeErrorState extends AnimeState {
  final String error;
   AnimeErrorState({required this.error});
}
