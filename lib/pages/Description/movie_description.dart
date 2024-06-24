// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/Bloc/movieDescriptionBloc/movie_description_bloc.dart';

class MovieDescription extends StatefulWidget {
  const MovieDescription({super.key});

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            return Container();
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
