import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_description_event.dart';
part 'anime_description_state.dart';

class AnimeDescriptionBloc
    extends Bloc<AnimeDescriptionEvent, AnimeDescriptionState> {
  AnimeDescriptionBloc() : super(AnimeDescriptionInitial()) {
    on((AnimeDescriptionLoadEvent event,
        Emitter<AnimeDescriptionState> emit) async {
      emit(AnimeDescriptionLoading());

      await Future.delayed(const Duration(seconds: 2)); // Simulate an API call
      emit(AnimeDescriptionLoaded());
    });
  }
}
