import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/upcoming_moveis_model.dart';

part 'movie_description_event.dart';
part 'movie_description_state.dart';

class MovieDescriptionBloc
    extends Bloc<MovieDescriptionEvent, MovieDescriptionState> {
  MovieDescriptionBloc() : super(MovieDescriptionInitial()) {
    on<MovieDescriptionLoadEvent>(_movieDescriptionLoadEvent);
  }

  FutureOr<void> _movieDescriptionLoadEvent(MovieDescriptionLoadEvent event,
      Emitter<MovieDescriptionState> emit) async {
    try {
      emit(MovieDescriptionLoadingState());
      emit(MovieDescriptionLoadedState());
    } catch (e) {}
  }
}
