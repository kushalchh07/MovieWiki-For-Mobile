part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}
class MoviesIninitial extends MoviesEvent {}
class LoadMoviesEvent extends MoviesEvent {}
