// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/constants/size/size.dart';

import '../../logic/Bloc/movieDescriptionBloc/movie_description_bloc.dart';
import '../../pages/Description/movie_description.dart';

Widget customCards({
  required dynamic context,
  required String title,
  required dynamic index,
  required String backdroppath,
  required String name,
  required String posterpath,
  DateTime? releasedate,
  required double popularity,
  required String overview,
  required bool adult,
  String? mediaType,
  bool? trending,
}) {
  AppSize size = AppSize(context: context);
  // bool isMovie = true;
  // log(mediaType.toString());
  // if (mediaType == "movie") {
  //   isMovie = true;
  // } else {
  //   isMovie = false;
  // }
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              // QuizQuestionsBloc

              BlocProvider(
                create: (context) => MovieDescriptionBloc(),
              ),
              // BlocProvider(create: (context) => CourseAuthorBloc())
            ],
            child: MovieDescription(
              backdroppath: backdroppath,
              context: context,
              title: title,
              index: index,
              posterpath: posterpath,
              releasedate: releasedate,
              popularity: popularity,
              overview: overview,
              adult: adult,
              mediaType: mediaType ?? '',
              trending: trending??false,
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
                  'https://image.tmdb.org/t/p/w500$posterpath',
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
                      // if (isMovie)
                      Text(
                        name == '' ? title : name,
                        style: TextStyle(
                          color: myBlack,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                      ),
                      // if (!isMovie)
                      //   Text(
                      //     name!,
                      //     style: TextStyle(
                      //       color: myBlack,
                      //       fontFamily: 'inter',
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 25,
                      //     ),
                      //     overflow: TextOverflow.ellipsis, // Prevent overflow
                      // ),
                      Text(
                        'Release Date: ${releasedate?.day}/${releasedate?.month}/${releasedate?.year}',
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
