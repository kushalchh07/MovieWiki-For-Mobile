// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_wiki/constants/colors/colors.dart';

Widget customCardsAnime({
  required String title,
  required String posterpath,
  DateTime? releasedate,
  double? popularity,
}) {
  final String releaseDateString =
      releasedate != null ? releasedate.toString() : 'Unknown';

  return GestureDetector(
    onTap: () {},
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
                        title,
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
