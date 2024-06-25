part of 'anime_description_bloc.dart';

@immutable
sealed class AnimeDescriptionState {}

final class AnimeDescriptionInitial extends AnimeDescriptionState {}
final class AnimeDescriptionLoading extends AnimeDescriptionState {}
final class AnimeDescriptionLoaded extends AnimeDescriptionState {

}

final class AnimeDescriptionError extends AnimeDescriptionState {}

