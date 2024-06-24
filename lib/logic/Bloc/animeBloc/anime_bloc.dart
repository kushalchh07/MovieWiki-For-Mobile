import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/top_anime_model.dart';
import 'package:movie_wiki/models/top_manga_model.dart';
import 'package:movie_wiki/repository/top_manga_repository.dart';

import '../../../repository/top_animes_repository.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(AnimeInitial()) {
    on<AnimeLoadEvent>(_animeLoadEvent);
  }

  FutureOr<void> _animeLoadEvent(
      AnimeLoadEvent event, Emitter<AnimeState> emit) async {
    try {
      emit(AnimeLoadingState());
      TopAnimesRepository topAnimesRepository = TopAnimesRepository();
      TopMangaRepository topMangaRepository = TopMangaRepository();

      dynamic topAnimes = await topAnimesRepository.getTopAnimes();

      dynamic topManga = await topMangaRepository.getTopManga();

      if (topAnimes == null || topManga == null) {
        throw Exception('Failed to load response: Response is null');
      }
      final topAnimesList = topAnimes.data;
      final topMangaList = topManga.data;
      log(topAnimesList.toString());
      emit(AnimeLoadedState(
          topAnimesList: topAnimesList, topMangaList: topMangaList));
    } catch (e) {
      emit(AnimeErrorState(error: e.toString()));
    }
  }
}
