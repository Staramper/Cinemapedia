import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

import '../../delegates/search_movie_delegate.dart';
import '../../providers/providers.dart';



class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final colors = Theme.of(context).colorScheme;
  final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon( Icons.movie_outlined, color: colors.primary ),
              const SizedBox( width: 5 ),
              Text('Cinemapedia', style: titleStyle),

              const Spacer(),

              IconButton(onPressed: (){

                final serchedMovies = ref.read(serchedMoviesProvider);
                final searchQuery = ref.read(searchQueryProvider);

                showSearch<Movie?>(
                  query: searchQuery,
                  context: context,
                  delegate: SearchMovieDelegate(
                    initialMovies: serchedMovies,
                    searchMovies: ref.read(serchedMoviesProvider.notifier).serchedMoviesByQuery,
                  )
                ).then((movie){
                  if(movie == null) return;

                  // ignore: use_build_context_synchronously
                  context.push('/home/0/movie/${movie.id}');
                });

              },
              icon: const Icon(Icons.search))
            ],
          ),
        ),
        )
      );
  }
}