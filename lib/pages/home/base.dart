// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/constants/constants.dart';
import 'package:movie_wiki/logic/Bloc/internet_bloc/internet_bloc.dart';
import 'package:movie_wiki/logic/Bloc/internet_bloc/internet_state.dart';
import 'package:movie_wiki/pages/home/animes.dart';
import 'package:movie_wiki/pages/home/homepage.dart';
import 'package:movie_wiki/pages/home/movies.dart';
import 'package:movie_wiki/pages/home/tvshows.dart';
import 'package:movie_wiki/pages/login&signup/login.dart';
import 'package:movie_wiki/services/firebaseAuth_service.dart';

class Base extends StatefulWidget {
  Base({super.key, this.indexNum});
  int? indexNum;

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    int? _selectedIndex = (widget.indexNum == null) ? 0 : widget.indexNum;
    void _onItemTapped(int index) {
      setState(() {
        // log("index ${index}");
        widget.indexNum = index;
      });
    }

    final screens = [
      Homepage(),

      const Movies(),
      const TvShows(),
      // const ForumScreen(),
      Animes(),
    ];
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetDisconnected) {
          log(state.toString());
        }
        if (state is InternetConnected) {
          log(state.toString());

          return Scaffold(
              backgroundColor: whiteColor,
              // appBar: CustomAppBar(
              //   height: size.height() * 0.12,
              // ),
              // drawer: CustomDrawer(),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex!,
                selectedItemColor: primaryColor,
                selectedFontSize: Get.height * 0.015,
                unselectedItemColor: Colors.grey,
                backgroundColor: whiteColor,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.movie),
                    label: 'Movies',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.tv_rounded),
                    label: 'Tv Show',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Icon(
                  //     Icons.forum,
                  //     size: 23,
                  //   ),
                  //   label: 'Forum',
                  // ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.animation_rounded),
                    label: 'Animes',
                  ),
                ],
              ),
              body: screens[_selectedIndex]);
        }
        return Scaffold(
            backgroundColor: whiteColor,
            // appBar: CustomAppBar(
            //   height: size.height() * 0.12,
            // ),
            // drawer: CustomDrawer(),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex!,
              selectedItemColor: primaryColor,
              selectedFontSize: Get.height * 0.015,
              unselectedItemColor: Colors.grey,
              backgroundColor: whiteColor,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.movie),
                  label: 'Movies',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.tv_rounded),
                  label: 'Tv Show',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.forum,
                //     size: 23,
                //   ),
                //   label: 'Forum',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.animation_rounded),
                  label: 'Animes',
                ),
              ],
            ),
            body: screens[_selectedIndex]);
      },
    );
  }
}
