// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:movie_wiki/logic/Bloc/animeDescriptionBloc/anime_description_bloc.dart';
import 'package:movie_wiki/pages/Description/trailerScreen/trailer_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  final bool isTrailorAvailable;
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
    required this.isTrailorAvailable,
  });

  @override
  State<AnimeDescription> createState() => _AnimeDescriptionState();
}

class _AnimeDescriptionState extends State<AnimeDescription> {
  late YoutubePlayerController _controller;

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final videoId = YoutubePlayer.convertUrlToId(widget.trailorUrl);
  //   _controller = YoutubePlayerController(
  //     initialVideoId: videoId!,
  //     flags: const YoutubePlayerFlags(
  //       autoPlay: true,
  //       mute: false,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleEnglish),
        leadingWidth: 70,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              // Get.back();
            },
            child: Icon(Icons.arrow_back_ios)),
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
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.3,
                      width: Get.width * 0.9,
                      child: Center(
                        child: Image.network(
                          "${widget.thumbnail}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // YoutubePlayer(
                    //   controller: _controller,
                    //   showVideoProgressIndicator: true,
                    //   onReady: () => print('Player is ready.'),
                    // ),
                    if (widget.isTrailorAvailable == true)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Trailer available: ",
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'poppins'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(TrailerScreen(
                                trailerUrl: widget.trailorUrl,
                                title: widget.titleEnglish,
                              ));
                            },
                            child: Text(
                              "Watch Trailer Now",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'poppins',
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    Row(
                      children: [
                        Container(
                          height: Get.height * 0.25,
                          width: Get.width * 0.4,
                          child: Card(
                            child: Image.network(
                              "${widget.image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.titleEnglish,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'poppins'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                widget.titleJapanese,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'poppins'),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Season:${widget.season} ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins',
                                    color: myLightGrey),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Total episodes:${widget.episodes} ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins',
                                    color: myLightGrey),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Duration :${widget.duration} ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins',
                                    color: myLightGrey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Overview:',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins'),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      // height: Get.height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.description,
                          style: TextStyle(
                              fontSize: 16,
                              color: myGrey,
                              fontFamily: 'poppins'),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
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
