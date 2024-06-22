// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_wiki/constants/colors/colors.dart';

Widget customCards({
  required String title,
  required String posterpath,
  required DateTime releasedate,
  required double popularity,
}) {
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
                  'https://image.tmdb.org/t/p/w500$posterpath',
                  fit: BoxFit.cover,
                  width: double.infinity, // Ensures image covers full width
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: myBlack,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                      ),
                      Text(
                        'Release Date: ${releasedate.day}/${releasedate.month}/${releasedate.year}',
                        style: TextStyle(
                          color: myBlack,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Popularity: $popularity',
                        style: TextStyle(
                          color: myBlack,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
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
