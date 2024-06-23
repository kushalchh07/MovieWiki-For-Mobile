import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tvshows_event.dart';
part 'tvshows_state.dart';

class TvshowsBloc extends Bloc<TvshowsEvent, TvshowsState> {
  TvshowsBloc() : super(TvshowsInitial()) {
    on<TvshowsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
