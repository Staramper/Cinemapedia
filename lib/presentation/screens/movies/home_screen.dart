import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNewPage();
    ref.read(popularMoviesProvider.notifier).loadNewPage();
  }

  @override
  Widget build(BuildContext context) {

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);

    // if ( nowPlayingMovies.isEmpty ) return const CircularProgressIndicator();

    return CustomScrollView(
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
                  movies: nowPlayingMovies,
                  title: 'Proximamente',
                  subTitle: 'En este mes',
                  loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNewPage(),
                  ),
                
                MoviesHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  // subTitle: '',
                  loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNewPage(),
                  ),
                
                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Mejor calificadas',
                  subTitle: 'De todos los tiempos',
                  loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNewPage(),
                  ),

                  const SizedBox(height: 10),
              ],
            );
          },
          childCount: 1,
        ))

      ]
    );
  }
}
