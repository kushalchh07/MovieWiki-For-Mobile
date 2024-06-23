import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(AnimeInitial()) {
    on<AnimeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
