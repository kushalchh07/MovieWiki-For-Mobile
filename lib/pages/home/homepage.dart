// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/constants/size/size.dart';
import 'package:movie_wiki/logic/Bloc/Homebloc/home_bloc.dart';
import 'package:movie_wiki/models/upcoming_moveis_model.dart';
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
            return showHomePage(size, context, state.upcomingMoviesList);
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

Widget showHomePage(AppSize size, BuildContext context, List<Result> results) {
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        title: Text(
          "MovieWiki",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'poppins',
            fontSize: 25,
          ),
        ),
        centerTitle: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
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
                  itemCount: results.length < 3 ? 3 : results.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 300,
                    childAspectRatio: 0.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final result = results[index];
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
                  itemCount: results.length > 3 ? 3 : results.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 300,
                    childAspectRatio: 0.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final result = results[index];
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
                  context: context, dividerText: "Popular TV Shows", desc: ''),
              SizedBox(
                height: 320, // Adjust the height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: results.length > 3 ? 3 : results.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 300,
                    childAspectRatio: 0.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return customCards(
                      title: result.title,
                      posterpath: result.posterPath,
                      releasedate: result.releaseDate,
                      popularity: result.popularity,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
