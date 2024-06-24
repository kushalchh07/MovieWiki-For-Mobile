import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_description_event.dart';
part 'anime_description_state.dart';

class AnimeDescriptionBloc extends Bloc<AnimeDescriptionEvent, AnimeDescriptionState> {
  AnimeDescriptionBloc() : super(AnimeDescriptionInitial()) {
    on<AnimeDescriptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
