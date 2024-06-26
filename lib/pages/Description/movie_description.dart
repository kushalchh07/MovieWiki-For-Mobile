// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:movie_wiki/constants/colors/colors.dart';
import '../../logic/Bloc/movieDescriptionBloc/movie_description_bloc.dart';

class MovieDescription extends StatefulWidget {
  final bool adult;
  final String overview;
  final dynamic context;
  final String title;
  final dynamic index;
  final String posterpath;
  final DateTime releasedate;
  final double popularity;
  final String backdroppath;

  MovieDescription({
    super.key,
    required this.context,
    required this.title,
    required this.index,
    required this.posterpath,
    required this.releasedate,
    required this.popularity,
    required this.overview,
    required this.adult,
    required this.backdroppath,
  });

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<MovieDescriptionBloc, MovieDescriptionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is MovieDescriptionInitial) {
            log("MovieDescription initial State");
            BlocProvider.of<MovieDescriptionBloc>(context)
                .add(MovieDescriptionLoadEvent());
          }
          if (state is MovieDescriptionLoadingState) {
            log("MovieDescription Loading State");
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MovieDescriptionLoadedState) {
            log("MovieDescription Loaded State");
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.3,
                      width: Get.width * 0.9,
                      child: Center(
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${widget.backdroppath}",
                          fit: BoxFit.fill,
                          height: 300,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: Get.height * 0.2,
                          width: Get.width * 0.3,
                          child: Card(
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${widget.posterpath}",
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'poppins'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Release Date: ${DateFormat.yMMMd().format(widget.releasedate)}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: myGrey,
                                    fontFamily: 'poppins'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Popularity: ${widget.popularity}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: myGrey,
                                    fontFamily: 'poppins'),
                              ),
                              if (widget.adult)
                                Text(
                                  'Adult: For 18+ only',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red, // Adjust color as needed
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Overview',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins'),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        widget.overview,
                        style: TextStyle(
                            fontSize: 18,
                            color: myLightGrey,
                            fontFamily: 'poppins'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is MovieDescriptionErrorState) {
            log("MovieDescription Error State");
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
