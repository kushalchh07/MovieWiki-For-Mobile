import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesBloc() : super(UpcomingMoviesInitial()) {
    on<UpcomingMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
