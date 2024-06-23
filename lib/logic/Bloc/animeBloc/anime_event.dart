part of 'anime_bloc.dart';

@immutable
sealed class AnimeEvent {}

final class AnimeLoadEvent extends AnimeEvent {}