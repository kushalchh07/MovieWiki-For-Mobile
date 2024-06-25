// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/logic/Bloc/animeDescriptionBloc/anime_description_bloc.dart';
import 'package:movie_wiki/pages/Description/anime_description.dart';

Widget customCardsAnime(
    {required dynamic index,
    dynamic context,
    required String titleEnglish,
    String? titleJapanese,
    required String posterpath,
    DateTime? releasedate,
    double? popularity,
    String? overview,
    String? thumbnail,
    String? season,
    String? episodes,
    String? duration,
    String? trailorUrl}) {
  final String releaseDateString =
      releasedate != null ? releasedate.toString() : 'Unknown';

  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              // QuizQuestionsBloc

              BlocProvider(
                create: (context) => AnimeDescriptionBloc(),
              ),
              // BlocProvider(create: (context) => CourseAuthorBloc())
            ],
            child: AnimeDescription(
              titleEnglish: titleEnglish,
              titleJapanese: titleJapanese ?? '',
              description: overview ?? '',
              image: posterpath,
              rating: popularity.toString(),
              season: season ?? '',
              episodes: episodes ?? '',
              duration: duration ?? '',
              // airedOn: '',
              context: null,
              index: null, thumbnail: thumbnail ?? '',
              trailorUrl: trailorUrl ?? '',
            ),
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width * 0.4,
        height: 300, // Adjusted width for better aspect ratio
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7, // Adjusted flex to better distribute space
                child: Image.network(
                  '$posterpath',
                  fit: BoxFit.cover,
                  width: double.infinity, // Ensures image covers full width
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleEnglish,
                        style: TextStyle(
                          color: myBlack,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                      ),
                      Text(
                        'Release Date: ${releaseDateString}',
                        style: TextStyle(
                          color: myGrey,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        'Popularity: $popularity',
                        style: TextStyle(
                          color: myGrey,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
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
