import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  TopRatedMoviesBloc() : super(TopRatedMoviesInitial()) {
    on<TopRatedMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
