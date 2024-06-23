// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_wiki/constants/size/size.dart';
import 'package:movie_wiki/logic/Bloc/TvShowsBloc/tvshows_bloc.dart';

import '../../utils/customWidgets/custom_cards.dart';
import '../../utils/customWidgets/dividerText.dart';

class TvShows extends StatefulWidget {
  const TvShows({super.key});

  @override
  State<TvShows> createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    BlocProvider.of<TvshowsBloc>(context).add(LoadTvshowsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<TvshowsBloc, TvshowsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is TvshowsInitial) {
          BlocProvider.of<TvshowsBloc>(context).add(LoadTvshowsEvent());
        }
        if (state is TvshowsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TvshowsLoadedState) {
          final AppSize size = AppSize(context: context);
          return showTvPage(size, context, state);
        }
        if (state is TvshowsErrorState) {
          return const Center(child: Text('Error Occurred'));
        }
        return Container();
      },
    ));
  }
}

Widget showTvPage(
    AppSize size, BuildContext context, TvshowsLoadedState state) {
  return Scaffold(
    body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          BlocProvider.of<TvshowsBloc>(context).add(LoadTvshowsEvent());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              dividerText(
                  context: context, dividerText: "Trending Tv Shows", desc: ''),
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
                    return customCards(
                      title: result.name,
                      posterpath: result.posterPath,
                      releasedate: result.firstAirDate,
                      popularity: result.popularity,
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
