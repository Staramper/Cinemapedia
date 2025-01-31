import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../movies/movies_repository_provider.dart';


final searchQueryProvider = StateProvider<String>((ref) => '');

final serchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref){

  final movieRepository = ref.read(movieRepositoryProvider);

    return SearchedMoviesNotifier(
      searchedMovies: movieRepository.searchMovies,
      ref: ref
    );
});


typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {

  final SearchMoviesCallBack searchedMovies;
  final Ref ref;

  SearchedMoviesNotifier({
    required this.searchedMovies,
    required this.ref,
  }): super([]);

  Future<List<Movie>> serchedMoviesByQuery(String query) async{

    final List<Movie> movies = await searchedMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    
    state = movies;
    return movies;
  }
}