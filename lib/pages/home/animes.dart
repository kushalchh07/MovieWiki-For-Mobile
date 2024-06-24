// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_wiki/logic/Bloc/animeBloc/anime_bloc.dart';

import '../../constants/size/size.dart';
import '../../utils/customWidgets/customCard_for_anime.dart';
import '../../utils/customWidgets/custom_cards.dart';
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

    BlocProvider.of<AnimeBloc>(context).add(AnimeLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AnimeBloc, AnimeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AnimeInitial) {
            log("home initial State");

            BlocProvider.of<AnimeBloc>(context).add(AnimeLoadEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AnimeLoadingState) {
            log("home loading State");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AnimeLoadedState) {
            log("home Loaded State");

            final AppSize size = AppSize(context: context);
            return showAnimePage(size, context, state);
          }
          if (state is AnimeErrorState) {
            log("home Error State");
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
  return Scaffold(
    body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          BlocProvider.of<AnimeBloc>(context).add(AnimeLoadEvent());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              dividerText(
                  context: context,
                  dividerText: "Recommended Animes",
                  desc: ''),
              SizedBox(
                height: 320, // Adjust the height as needed
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
                    // final releaseDate = result.entry.first.aired.from ?? '';
                    // final popularity = result.entry.first.score;
                    return customCardsAnime(
                      context: context,
                      title: result.entry.first.title,
                      posterpath: imageUrl,
                      // releasedate: result.aired.from,
                      // popularity: result.score,
                    );
                  },
                ),
              ),
              dividerText(
                  context: context, dividerText: "Top Animes", desc: ''),
              SizedBox(
                height: 320, // Adjust the height as needed
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
                    final result = state.topAnimesList[index];
                    final imageUrl = result.images['jpg']?.imageUrl ?? '';
                    return customCardsAnime(
                      context: context,
                      title: result.title,
                      posterpath: imageUrl,
                      releasedate: result.aired.from,
                      popularity: result.score,
                    );
                  },
                ),
              ),
              dividerText(
                  context: context, dividerText: "Top Mangas", desc: ''),
              SizedBox(
                height: 320, // Adjust the height as needed
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
                      context: context,
                      title: result.title,
                      posterpath: imageUrl,
                      releasedate: result.published!.from,
                      popularity: result.score,
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
