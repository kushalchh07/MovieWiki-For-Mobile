import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/models/recommended_anime_model.dart';
import 'package:movie_wiki/models/top_anime_model.dart';
import 'package:movie_wiki/models/top_manga_model.dart';
import 'package:movie_wiki/repository/recommended_anime_repository.dart';
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
      RecommendedAnimesRepository recommendedAnimesRepository =
          RecommendedAnimesRepository();

      dynamic topAnimes = await topAnimesRepository.getTopAnimes();

      dynamic topManga = await topMangaRepository.getTopManga();
      dynamic recommendedAnimes =
          await recommendedAnimesRepository.getRecommendedAnimes();

      if (topAnimes == null || topManga == null) {
        throw Exception('Failed to load response: Response is null');
      }
      final topAnimesList = topAnimes.data;
      final topMangaList = topManga.data;
      final recommendedAnimesList = recommendedAnimes.data;

      // log(topAnimesList.toString());
      // log(recommendedAnimesList.toString());

      emit(AnimeLoadedState(
          topAnimesList: topAnimesList,
          topMangaList: topMangaList,
          recommendedAnimesList: recommendedAnimesList));
    } catch (e) {
      emit(AnimeErrorState(error: e.toString()));
    }
  }
}
