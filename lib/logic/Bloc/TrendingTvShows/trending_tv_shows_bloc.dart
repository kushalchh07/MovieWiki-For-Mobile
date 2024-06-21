import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trending_tv_shows_event.dart';
part 'trending_tv_shows_state.dart';

class TrendingTvShowsBloc extends Bloc<TrendingTvShowsEvent, TrendingTvShowsState> {
  TrendingTvShowsBloc() : super(TrendingTvShowsInitial()) {
    on<TrendingTvShowsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
