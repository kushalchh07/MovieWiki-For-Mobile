// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/constants/size/size.dart';
import 'package:movie_wiki/logic/Bloc/Homebloc/home_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
            return showhomePage(size, context);
          }
          if (state is HomeErrorState) {
            log("home Error State");
            return const Center(child: Text('Error Occured'));
          }
          return Container();
        },
      ),
    );
  }
}

showhomePage(AppSize size, BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: Text(
          "MovieWiki",
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
    ),
    body: Container(
      child: Column(
        children: [Text("data")],
      ),
    ),
  );
}
