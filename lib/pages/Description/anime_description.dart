// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:movie_wiki/logic/Bloc/animeDescriptionBloc/anime_description_bloc.dart';
import 'package:movie_wiki/pages/Description/trailerScreen/trailer_screen.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final String rank;
  final dynamic context;
  final dynamic index;
  final String thumbnail;
  final String trailorUrl;
  final bool isTrailorAvailable;
  final String type;
  final String author;
  final bool isRecommendationAnime;
  final String url;
  // final bool isTopAnime;
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
    required this.type,
    required this.rank,
    required this.author,
    required this.isRecommendationAnime,
    required this.url,
    // required this.isTopAnime,
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
  void _launchURL() async {
    final urL = widget.url;
    if (await canLaunch(urL)) {
      await launch(urL);
    } else {
      throw 'Could not launch $urL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleEnglish),
        leadingWidth: 70,
        // leading: BackButton(
        //   onPressed: () => Navigator.pop(context),
        // ),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                          height: Get.height * 0.28,
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
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == false)
                                Text(
                                  widget.titleJapanese,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'poppins'),
                                ),
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == true)
                                ElevatedButton(
                                  onPressed: _launchURL,
                                  child: Text('More info'),
                                ),
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == false)
                                Text(
                                  "Type:${widget.type} ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'poppins',
                                      color: myLightGrey),
                                ),
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == false)
                                Text(
                                  "Rating:${widget.rating} ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'poppins',
                                      color: myLightGrey),
                                ),
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == false)
                                Text(
                                  "Rank:${widget.rank} ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'poppins',
                                      color: myLightGrey),
                                ),
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == false)
                                Text(
                                  "Season:${widget.season} ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'poppins',
                                      color: myLightGrey),
                                ),
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == false)
                                Text(
                                  "Total episodes:${widget.episodes} ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'poppins',
                                      color: myLightGrey),
                                ),
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == false)
                                Text(
                                  "Duration :${widget.duration} ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'poppins',
                                      color: myLightGrey),
                                ),
                              SizedBox(height: 4),
                              if (widget.isRecommendationAnime == false)
                                Text(
                                  "Author :${widget.author} ",
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
                    if (widget.isRecommendationAnime == false)
                      ElevatedButton(
                        onPressed: _launchURL,
                        child: Text('More info'),
                      ),
                    SizedBox(height: 14),
                    Text(
                      'Overview:',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins'),
                    ),
                    SizedBox(height: 4),
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
