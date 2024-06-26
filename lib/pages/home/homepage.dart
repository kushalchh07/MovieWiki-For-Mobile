// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/constants/size/size.dart';
import 'package:movie_wiki/logic/Bloc/Homebloc/home_bloc.dart';
import 'package:movie_wiki/logic/Bloc/Homebloc/home_state.dart';

import 'package:movie_wiki/models/upcoming_moveis_model.dart';
import 'package:movie_wiki/utils/customWidgets/custom_card_for_tvshows.dart';
import 'package:movie_wiki/utils/customWidgets/custom_cards.dart';
import 'package:movie_wiki/utils/customWidgets/dividerText.dart';
// import 'package:movie_wiki/models/top_rated_movies_model.dart';
// import 'package:movie_wiki/repository/upcoming_movies_repository.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is HomeInitialState) {
            BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());
          }
          if (state is HomeLoadingState) {
            log("home loading State");
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoadedState) {
            log("home loaded State");
            final AppSize size = AppSize(context: context);
            return showHomePage(size, context, state);
          }
          if (state is HomeErrorState) {
            log("home Error State");
            return const Center(child: Text('Error Occurred'));
          }
          return Container();
        },
      ),
    );
  }
}

Widget showHomePage(AppSize size, BuildContext context, HomeLoadedState state) {
  return Scaffold(
    // appBar: AppBar(
    //   toolbarHeight: 120,
    //   backgroundColor: primaryColor,
    //   elevation: 0,
    //   leadingWidth: 30,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
    //   ),
    //   title: Padding(
    //     padding: const EdgeInsets.only(right: 20.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               top: 8.0, left: 8, right: 8, bottom: 15),
    //           child: Text(
    //             "MovieWiki",
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontFamily: 'poppins',
    //               fontSize: 25,
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 5,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 5.0),
    //           child: Container(
    //             width: Get.width,
    //             padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(30),
    //             ),
    //             child: TextField(
    //               decoration: InputDecoration(
    //                 hintText: 'Search',
    //                 hintStyle: TextStyle(color: Colors.grey),
    //                 border: InputBorder.none,
    //                 icon: Icon(Icons.search, color: Colors.grey),
    //               ),
    //               onChanged: (value) {
    //                 // Handle search logic here
    //               },
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   centerTitle: false,
    //   leading: Padding(
    //     padding: const EdgeInsets.only(bottom: 65.0),
    //     child: Builder(
    //       builder: (BuildContext context) {
    //         return IconButton(
    //           onPressed: () {
    //             Scaffold.of(context).openDrawer();
    //           },
    //           icon: Icon(
    //             Icons.menu,
    //             color: Colors.white,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.only(bottom: 20),
        children: <Widget>[
          Container(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
                color: primaryColor,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
    body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                      overview: result.overview,
                      index: index,
                      context: context,
                      title: result.title,
                      posterpath: result.posterPath,
                      releasedate: result.releaseDate,
                      popularity: result.popularity,
                      adult: result.adult,
                      backdroppath: result.backdropPath,
                    );
                  },
                ),
              ),
              dividerText(
                  context: context, dividerText: "Trending TV Shows", desc: ''),
              SizedBox(
                height: 320, // Adjust the height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.trendingTvShowsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 300,
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
              // dividerText(
              //     context: context, dividerText: "Trending Movies", desc: ''),
              // SizedBox(
              //   height: 320, // Adjust the height as needed
              //   child: GridView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: state.trendingMoviesList.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 1,
              //       mainAxisExtent: 300,
              //       childAspectRatio: 0.3,
              //       crossAxisSpacing: 10,
              //       mainAxisSpacing: 10,
              //     ),
              //     itemBuilder: (context, index) {
              //       final result = state.trendingMoviesList[index];
              //       return customCards(
              //         overview: result.overview,
              //         index: index,
              //         context: context,
              //         title: result.title,
              //         posterpath: result.posterPath,
              //         releasedate: result.releaseDate,
              //         popularity: result.popularity,
              //         adult: result.adult,
              //         backdroppath: result.backdropPath,
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ),
  );
}
