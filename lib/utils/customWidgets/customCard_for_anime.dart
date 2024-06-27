// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/logic/Bloc/animeDescriptionBloc/anime_description_bloc.dart';
import 'package:movie_wiki/pages/Description/anime_description.dart';

Widget customCardsAnime({
  required dynamic index,
  required BuildContext context,
  required String titleEnglish,
  String? titleJapanese,
  required String posterpath,
  bool isTrailorAvailable = false,
  DateTime? releasedate,
  double? popularity,
  String? overview,
  String? thumbnail,
  String? season,
  String? episodes,
  String? duration,
  String? trailorUrl,
  String? type,
  String? rank,
  String? author,
  bool isRecommendationAnime = false,
  String? url,
  bool isTopAnime = false,
}) {
  final String releaseDateString = releasedate?.toString() ?? 'Unknown';

  return GestureDetector(
    onTap: () {
      Get.to(
        () => MultiBlocProvider(
          providers: [BlocProvider(create: (_) => AnimeDescriptionBloc())],
          child: AnimeDescription(
            titleEnglish: titleEnglish,
            titleJapanese: titleJapanese ?? '',
            description: overview ?? '',
            image: posterpath,
            rating: popularity?.toString() ?? '',
            season: season ?? '',
            episodes: episodes ?? '',
            duration: duration ?? '',
            thumbnail: thumbnail ?? '',
            trailorUrl: trailorUrl ?? '',
            isTrailorAvailable: isTrailorAvailable,
            type: type ?? '',
            rank: rank ?? '',
            author: author ?? '',
            isRecommendationAnime: isRecommendationAnime,
            url: url ?? '',
            isTopAnime: isTopAnime,
            context: context,
            index: index,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width * 0.45,
        height: 300,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.25,
                width: Get.width,
                child: Image.network(
                  '$posterpath',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titleEnglish,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
