import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/top_anime_model.dart';

import '../../../repository/top_animes_repository.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(AnimeInitial()) {
    on<AnimeLoadEvent>(_animeLoadEvent);
  }

  FutureOr<void> _animeLoadEvent(AnimeLoadEvent event, Emitter<AnimeState> emit) async{
try{

  emit(AnimeLoadingState());
        TopAnimesRepository topAnimesRepository = TopAnimesRepository();

        dynamic topAnimes = await topAnimesRepository.getTopAnimes();

        if (topAnimes == null) {
          throw Exception('Failed to load response: Response is null');
        }
        final topAnimesList = topAnimes.data;

        log(topAnimesList.toString());
        emit(AnimeLoadedState(topAnimesList: topAnimesList));
  }
  catch(e){
    emit(AnimeErrorState(error: e.toString()));
  }

}

  }

