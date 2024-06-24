import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tvshow_description_event.dart';
part 'tvshow_description_state.dart';

class TvshowDescriptionBloc extends Bloc<TvshowDescriptionEvent, TvshowDescriptionState> {
  TvshowDescriptionBloc() : super(TvshowDescriptionInitial()) {
    on<TvshowDescriptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
