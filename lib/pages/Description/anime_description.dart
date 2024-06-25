// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:movie_wiki/logic/Bloc/animeDescriptionBloc/anime_description_bloc.dart';

import '../../constants/colors/colors.dart';

class AnimeDescription extends StatefulWidget {
  final String titleEnglish;
  final String titleJapanese;
  final String description;
  final String image;
  final String rating;

  final String season;
  final String episodes;
  final String duration;
  // final String airedOn;
  final dynamic context;
  final dynamic index;
  final String thumbnail;
  final String trailorUrl;
  const AnimeDescription({
    super.key,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.description,
    required this.image,
    required this.rating,
    required this.season,
    required this.episodes,
    required this.duration,
    // required this.airedOn,
    required this.context,
    required this.index,
    required this.thumbnail,
    required this.trailorUrl,
  });

  @override
  State<AnimeDescription> createState() => _AnimeDescriptionState();
}

class _AnimeDescriptionState extends State<AnimeDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.titleEnglish),
          ),
      body: BlocBuilder<AnimeDescriptionBloc, AnimeDescriptionState>(
        builder: (context, state) {
          if (state is AnimeDescriptionInitial) {
            BlocProvider.of<AnimeDescriptionBloc>(context)
                .add(AnimeDescriptionLoadEvent());
          
          }

          if (state is AnimeDescriptionLoading) {
            return const Center(child: CircularProgressIndicator());
          }


          if (state is AnimeDescriptionLoaded) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.3,
                        width: Get.width * 0.9,
                        child: Center(
                          child: Image.network("${widget.image}"),
                        ),
                  ),
                    Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.titleEnglish,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'poppins'),
                            ),
                            SizedBox(height: 10),
                            // Text(
                            //   'Release Date: ${DateFormat.yMMMd().format(widget.releasedate)}',
                            //   style: TextStyle(
                            //       fontSize: 16,
                            //       color: myGrey,
                            //       fontFamily: 'poppins'),
                            // ),
                            SizedBox(height: 10),
                            // Text(
                            //   'Popularity: ${widget.popularity}',
                            //   style: TextStyle(
                            //       fontSize: 16,
                            //       color: myGrey,
                            //       fontFamily: 'poppins'),
                            // ),
                            // if (widget.adult)
                            //   Text(
                            //     'Adult: For 18+ only',
                            //     style: TextStyle(
                            //       fontSize: 16,
                            //       color: Colors.red, // Adjust color as needed
                            //     ),
                            //   ),
                          ],
                        ),
                      ),
                ],
              ),
            );
          }

          if (state is AnimeDescriptionError) {
            return Container();
          }

          return Container();
        },
      ),
    );
  }
}
