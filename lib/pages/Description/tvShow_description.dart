// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';

import '../../constants/colors/colors.dart';
import '../../logic/Bloc/TvShowDescriptionbloc/tvshow_description_bloc.dart';

class TvShowDescription extends StatefulWidget {
  final bool adult;
  final String overview;
  final dynamic context;
  final String title;
  final dynamic index;
  final String posterpath;
  final DateTime releasedate;
  final double popularity;
  final String backdroppath;

  const TvShowDescription({
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
  State<TvShowDescription> createState() => _TvShowDescriptionState();
}

class _TvShowDescriptionState extends State<TvShowDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<TvshowDescriptionBloc, TvshowDescriptionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is TvshowDescriptionInitial) {
            log("TvshowDescription initial State");
            BlocProvider.of<TvshowDescriptionBloc>(context)
                .add(TvshowDescriptionInitialEvent());
          }
          if (state is TvshowDescriptionLoading) {
            log("TvshowDescription Loading State");
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TvshowDescriptionLoaded) {
            log("TvshowDescription Loaded State");
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 22,
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
                  Text(
                    widget.overview,
                    style: TextStyle(
                        fontSize: 18, color: myGrey, fontFamily: 'poppins'),
                  ),
                ],
              ),
            );
          }
          if (state is TvshowDescriptionError) {
            log("TvshowDescription Error State");
            return const Center(child: Text('Error Occurred'));
          }

          return Container();
        },
      ),
    );
  }
}
