// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_wiki/constants/size/size.dart';
import 'package:movie_wiki/logic/Bloc/TvShowsBloc/tvshows_bloc.dart';
import 'package:movie_wiki/utils/customWidgets/custom_card_for_tvshows.dart';

import '../../constants/colors/colors.dart';
import '../../utils/customWidgets/custom_cards.dart';
import '../../utils/customWidgets/dividerText.dart';

class TvShows extends StatefulWidget {
  const TvShows({super.key});

  @override
  State<TvShows> createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // BlocProvider.of<TvshowsBloc>(context).add(LoadTvshowsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 120,
          backgroundColor: primaryColor,
          elevation: 0,
          leadingWidth: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8, right: 8, bottom: 15),
                  child: Text(
                    "TvShows",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.grey),
                      ),
                      onChanged: (value) {
                        // Handle search logic here
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocConsumer<TvshowsBloc, TvshowsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is TvshowsInitial) {
              log("TvShows initial State");
              BlocProvider.of<TvshowsBloc>(context).add(LoadTvshowsEvent());
            }
            if (state is TvshowsLoadingState) {
              log("TvShows Loading State");

              return const Center(child: CircularProgressIndicator());
            }
            if (state is TvshowsLoadedState) {
              log("TvShows Loaded State");

              final AppSize size = AppSize(context: context);
              return showTvPage(size, context, state);
            }
            if (state is TvshowsErrorState) {
              log("TvShows Error State");

              return const Center(child: Text('Error Occurred'));
            }
            return Container();
          },
        ));
  }
}

Widget showTvPage(
    AppSize size, BuildContext context, TvshowsLoadedState state) {
  return Scaffold(
    body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          BlocProvider.of<TvshowsBloc>(context).add(LoadTvshowsEvent());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              dividerText(
                  context: context, dividerText: "Trending Tv Shows", desc: ''),
              SizedBox(
                height: 250, // Adjust the height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.trendingTvShowsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 180,
                    childAspectRatio: 0.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final result = state.trendingTvShowsList[index];
                    return customCardsTvshows(
                      index: index,
                      context: context,
                      title: result.name,
                      posterpath: result.posterPath,
                      releasedate: result.firstAirDate,
                      popularity: result.popularity,
                      backdroppath: result.backdropPath,
                      overview: result.overview,
                      adult: result.adult,
                    );
                  },
                ),
              ),
              dividerText(
                  context: context,
                  dividerText: "Top Rated Tv Series",
                  desc: ''),
              SizedBox(
                height: 250, // Adjust the height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.topRatedTvSeriesList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 180,
                    childAspectRatio: 0.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final result = state.topRatedTvSeriesList[index];
                    return customCardsTvshows(
                      index: index,
                      context: context,
                      title: result.name,
                      posterpath: result.posterPath,
                      releasedate: result.firstAirDate,
                      popularity: result.popularity,
                      backdroppath: result.backdropPath,
                      overview: result.overview,
                      adult: result.adult,
                    );
                  },
                ),
              ),
              dividerText(
                  context: context, dividerText: "Popular Tv Shows", desc: ''),
              SizedBox(
                height: 250, // Adjust the height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.popularTvSeriesList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 180,
                    childAspectRatio: 0.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final result = state.popularTvSeriesList[index];
                    return customCardsTvshows(
                      backdroppath: result.backdropPath,
                      index: index,
                      context: context,
                      title: result.name,
                      posterpath: result.posterPath,
                      releasedate: result.firstAirDate,
                      popularity: result.popularity,
                      overview: result.overview,
                      adult: result.adult,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
