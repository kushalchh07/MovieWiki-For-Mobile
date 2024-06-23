// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_wiki/logic/Bloc/Homebloc/home_bloc.dart';
import 'package:movie_wiki/logic/Bloc/TvShowsBloc/tvshows_bloc.dart';
import 'package:movie_wiki/logic/Bloc/animeBloc/anime_bloc.dart';


import 'package:movie_wiki/logic/Bloc/internet_bloc/internet_bloc.dart';
import 'package:movie_wiki/logic/Bloc/loginbloc/login_bloc.dart';
import 'package:movie_wiki/logic/Bloc/moviesbloc/movies_bloc.dart';
import 'package:movie_wiki/logic/Bloc/signupbloc/signup_bloc.dart';
import 'package:movie_wiki/pages/SplashScreen/splashScreen.dart';
import 'package:movie_wiki/pages/home/movies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
        
        BlocProvider(
          create: (context) => MoviesBloc(),
        ),
        BlocProvider(
          create: (context) => TvshowsBloc(),
        ),
        BlocProvider(
          create: (context) => AnimeBloc(),
        ),
       
      ],
      child: GetMaterialApp(
        title: 'Movie Wiki',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
