import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'top_anime_event.dart';
part 'top_anime_state.dart';

class TopAnimeBloc extends Bloc<TopAnimeEvent, TopAnimeState> {
  TopAnimeBloc() : super(TopAnimeInitial()) {
    on<TopAnimeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
