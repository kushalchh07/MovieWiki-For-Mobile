// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_wiki/logic/Bloc/animeBloc/anime_bloc.dart';

import '../../constants/colors/colors.dart';
import '../../constants/size/size.dart';
import '../../utils/customWidgets/customCard_for_anime.dart';

import '../../utils/customWidgets/dividerText.dart';

class Animes extends StatefulWidget {
  const Animes({super.key});

  @override
  State<Animes> createState() => _AnimesState();
}

class _AnimesState extends State<Animes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // BlocProvider.of<AnimeBloc>(context).add(AnimeLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: primaryColor,
        elevation: 0,
        leadingWidth: 40,
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
                  "Animes",
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
              leading: Icon(Icons.people_alt_outlined),
              title: Text('Fav Characters'),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Top People'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits_sharp),
              title: Text('Producers'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: BlocConsumer<AnimeBloc, AnimeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AnimeInitial) {
            log("anime initial State");

            BlocProvider.of<AnimeBloc>(context).add(AnimeLoadEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AnimeLoadingState) {
            log("anime loading State");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AnimeLoadedState) {
            log("anime Loaded State");

            final AppSize size = AppSize(context: context);
            return showAnimePage(size, context, state);
          }
          if (state is AnimeErrorState) {
            log("anime Error State");
            return Center(
              child: Text(state.error),
            );
          }

          return Center();
        },
      ),
    );
  }
}

Widget showAnimePage(
    AppSize size, BuildContext context, AnimeLoadedState state) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: RefreshIndicator.adaptive(
      onRefresh: () async {
        BlocProvider.of<AnimeBloc>(context).add(AnimeLoadEvent());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dividerText(
                context: context, dividerText: "Recommended Animes", desc: ''),
            SizedBox(
              height: 280,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.recommendedAnimesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 300,
                  childAspectRatio: 0.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final result = state.recommendedAnimesList[index];
                  final imageUrl =
                      result.entry.first.images['jpg']?.imageUrl ?? '';
                  final titleEnglish = result.entry.first.title ?? '';
                  final overview = result.content ?? '';
                  return customCardsAnime(
                    index: index,
                    context: context,
                    titleEnglish: titleEnglish,
                    posterpath: imageUrl,
                    overview: overview,
                    isTrailorAvailable: false,
                    thumbnail: imageUrl,
                    season: '',
                    duration: '',
                    episodes: '',
                    isRecommendationAnime: true,
                    url: result.entry.first.url,
                  );
                },
              ),
            ),
            dividerText(context: context, dividerText: "Top Animes", desc: ''),
            SizedBox(
              height: 280,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.topAnimesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 300,
                  childAspectRatio: 0.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final anime = state.topAnimesList[index];
                  final imageUrl = anime.images['jpg']?.imageUrl ?? '';
                  final titleEnglish = anime.titleEnglish ?? '';
                  final titleJapanese = anime.titleJapanese ?? '';
                  final thumbnail = anime.trailer.images?.largeImageUrl ?? '';
                  final season = anime.season.toString().split('.').last;
                  final episodes = anime.episodes?.toString() ?? '';
                  final duration = anime.duration;
                  final trailerUrl = anime.trailer.url;
                  final overview = anime.synopsis ?? '';
                  return customCardsAnime(
                    index: index,
                    context: context,
                    titleEnglish: titleEnglish,
                    posterpath: imageUrl,
                    titleJapanese: titleJapanese,
                    overview: overview,
                    episodes: episodes,
                    duration: duration,
                    thumbnail: thumbnail,
                    season: season,
                    trailorUrl: trailerUrl,
                    isTrailorAvailable: true,
                    type: anime.type.toString().split('.').last,
                    popularity: anime.score,
                    rank: anime.rank.toString(),
                    url: anime.url,
                    isTopAnime: true,
                  );
                },
              ),
            ),
            dividerText(context: context, dividerText: "Top Mangas", desc: ''),
            SizedBox(
              height: 280,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.topMangaList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 300,
                  childAspectRatio: 0.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final result = state.topMangaList[index];
                  final imageUrl = result.images['jpg']?.imageUrl ?? '';
                  return customCardsAnime(
                      index: index,
                      context: context,
                      titleEnglish: result.title,
                      posterpath: imageUrl,
                      releasedate: result.published!.from,
                      popularity: result.score,
                      titleJapanese: result.titleJapanese,
                      thumbnail: imageUrl,
                      isTrailorAvailable: false,
                      overview: result.synopsis,
                      rank: result.rank.toString(),
                      type: result.type.toString().split('.').last,
                      author: result.authors?.first.name ?? '',
                      url: result.url);
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
