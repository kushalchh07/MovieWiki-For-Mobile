part of 'tvshow_description_bloc.dart';

@immutable
sealed class TvshowDescriptionState {}

final class TvshowDescriptionInitial extends TvshowDescriptionState {}

class TvshowDescriptionLoading extends TvshowDescriptionState {}

class TvshowDescriptionLoaded extends TvshowDescriptionState {}

class TvshowDescriptionError extends TvshowDescriptionState {}
