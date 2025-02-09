import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  FavoriteViewState createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState<FavoriteView> {

  bool isLoanding = false;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    loadNextPage();

  }

  void loadNextPage() async {
    if (isLoanding || isLastPage) return;

    setState(() {
      isLoanding = true;
    });

    final movies = await ref.read(faviteMoviesProvider.notifier).loadNextPage();

    setState(() {
      isLoanding = false;
      if (movies.isEmpty) {
        isLastPage = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    final favoriteMovies = ref.watch(faviteMoviesProvider).values.toList();

    if( favoriteMovies.isEmpty ){
      final colors = Theme.of(context).colorScheme;
      
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 60, color: colors.primary),
            Text('Ohhh no!!', style: TextStyle( fontSize: 30, color: colors.primary )),
            const Text('No tienes peliculas favoritas :(', style: TextStyle( fontSize: 20, color: Colors.black54)),

            const SizedBox(height: 20),
            
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: const Text('Empieza a buscar')
            )
          ],
        ),
      );


    }
     
    return Scaffold(
      body: MoviesMasonry(
        loandNextPage: loadNextPage,
        movies: favoriteMovies
        )
    );
  }
}