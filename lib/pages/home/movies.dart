// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_wiki/constants/size/size.dart';
import 'package:movie_wiki/logic/Bloc/moviesbloc/movies_bloc.dart';
import 'package:movie_wiki/utils/customWidgets/dividerText.dart';

import '../../constants/colors/colors.dart';
import '../../utils/customWidgets/custom_cards.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(LoadMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MoviesBloc, MoviesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is MoviesInitial) {
            log("Movies initial State");

            BlocProvider.of<MoviesBloc>(context).add(LoadMoviesEvent());
          }
          if (state is MoviesLoadingState) {
            log("Movies Loading State");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MoviesLoadedState) {
            log("Movies loaded State");

            final AppSize size = AppSize(context: context);

            return showMoviePage(size, context, state);
          }
          if (state is MoviesErrorState) {
            log("Movies error State");

            return const Center(
              child: Text('Error Occurred'),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget showMoviePage(
    AppSize size, BuildContext context, MoviesLoadedState state) {
  return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            BlocProvider.of<MoviesBloc>(context).add(LoadMoviesEvent());
          },
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                dividerText(
                    context: context,
                    dividerText: "Top Rated Movies",
                    desc: ''),
                SizedBox(
                  height: 320, // Adjust the height as needed
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.topRatedMoviesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 300,
                      childAspectRatio: 0.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final result = state.topRatedMoviesList[index];
                      return customCards(
                        title: result.title,
                        posterpath: result.posterPath,
                        releasedate: result.releaseDate,
                        popularity: result.popularity,
                      );
                    },
                  ),
                ),
                dividerText(
                    context: context, dividerText: "Upcoming Movies", desc: ''),
                SizedBox(
                  height: 320, // Adjust the height as needed
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.upcomingMoviesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 300,
                      childAspectRatio: 0.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final result = state.upcomingMoviesList[index];
                      return customCards(
                        title: result.title,
                        posterpath: result.posterPath,
                        releasedate: result.releaseDate,
                        popularity: result.popularity,
                      );
                    },
                  ),
                ),
                dividerText(
                    context: context, dividerText: "Trending Movies", desc: ''),
                SizedBox(
                  height: 320, // Adjust the height as needed
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.trendingMoviesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 300,
                      childAspectRatio: 0.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final result = state.trendingMoviesList[index];
                      return customCards(
                        title: result.title,
                        posterpath: result.posterPath,
                        releasedate: result.releaseDate,
                        popularity: result.popularity,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
