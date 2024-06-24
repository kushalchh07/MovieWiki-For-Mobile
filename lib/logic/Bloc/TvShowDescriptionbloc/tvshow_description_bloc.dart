import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tvshow_description_event.dart';
part 'tvshow_description_state.dart';

class TvshowDescriptionBloc
    extends Bloc<TvshowDescriptionEvent, TvshowDescriptionState> {
  TvshowDescriptionBloc() : super(TvshowDescriptionInitial()) {
    on<TvshowDescriptionInitialEvent>(_tvshowDescriptionInitialEvent);
  }

  FutureOr<void> _tvshowDescriptionInitialEvent(
      TvshowDescriptionInitialEvent event,
      Emitter<TvshowDescriptionState> emit) async {
    emit(TvshowDescriptionLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(TvshowDescriptionLoaded());
  }
}
