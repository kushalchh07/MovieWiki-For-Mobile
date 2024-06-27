// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/logic/Bloc/internet_bloc/internet_bloc.dart';
import 'package:movie_wiki/logic/Bloc/internet_bloc/internet_state.dart';
import 'package:movie_wiki/pages/home/animes.dart';
import 'package:movie_wiki/pages/home/homepage.dart';
import 'package:movie_wiki/pages/home/movies.dart';
import 'package:movie_wiki/pages/home/tvshows.dart';
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
              appBar: AppBar(
                toolbarHeight: 120,
                backgroundColor: primaryColor,
                elevation: 0,
                leadingWidth: 30,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
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
                          "MovieWiki",
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 0),
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
                centerTitle: false,
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 65.0),
                  child: Builder(
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
                  padding: EdgeInsets.only(bottom: 20),
                  children: <Widget>[
                    Container(
                      height: 150,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30)),
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
            appBar: AppBar(
              toolbarHeight: 120,
              backgroundColor: primaryColor,
              elevation: 0,
              leadingWidth: 30,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
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
                        "MovieWiki",
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 0),
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
              centerTitle: false,
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 65.0),
                child: Builder(
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
                    onTap: () async {
                      await AuthService.logout();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
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
