import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeLoadEvent>(_homeLoadEvent);
  }

  FutureOr<void> _homeLoadEvent(HomeLoadEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
  }
}
