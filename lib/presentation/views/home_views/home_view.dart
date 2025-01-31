import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNewPage();
    ref.read(popularMoviesProvider.notifier).loadNewPage();
    ref.read(upcomingMoviesProvider.notifier).loadNewPage();
    ref.read(topRatedMoviesProvider.notifier).loadNewPage();

  }

  @override
  Widget build(BuildContext context) {

    final initialLoanding = ref.watch(initialLoandingProvider);
    if (initialLoanding) return const FullScreenLoader();

    final slideShowMovies  = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies    = ref.watch(popularMoviesProvider);
    final upcomingMovies   = ref.watch(upcomingMoviesProvider);
    final topRatedMovies   = ref.watch(topRatedMoviesProvider);

    // if ( nowPlayingMovies.isEmpty ) return const CircularProgressIndicator();

    return Visibility(
      visible: !initialLoanding,
      child: CustomScrollView(
        slivers: [
      
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar(),
              titlePadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
      
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
              
                  // const CustomAppbar(),
              
                  MoviesSlideshow(movies: slideShowMovies),
              
                  MoviesHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En Cines',
                    subTitle: 'Viernes 13',
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNewPage(),
                    ),
              
                  MoviesHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Proximamente',
                    subTitle: 'En este mes',
                    loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNewPage(),
                    ),
                  
                  MoviesHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    // subTitle: '',
                    loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNewPage(),
                    ),
                  
                  MoviesHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'De todos los tiempos',
                    loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNewPage(),
                    ),
      
                    const SizedBox(height: 10),
                ],
              );
            },
            childCount: 1,
          ))
      
        ]
      ),
    );
  }
}