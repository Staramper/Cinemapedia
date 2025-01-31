import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrestructure/models/moviedb/movie_ditails.dart';
import 'package:cinemapedia/infrestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
        ? 'https://images.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'https://www.jakartaplayers.org/uploads/1/2/5/5/12551960/2297419_orig.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
        ? 'https://images.tmdb.org/t/p/w500${ moviedb.posterPath }'
        : 'https://www.jakartaplayers.org/uploads/1/2/5/5/12551960/2297419_orig.jpg',
      releaseDate: moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now(),
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
      );


  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
        ? 'https://images.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'https://www.jakartaplayers.org/uploads/1/2/5/5/12551960/2297419_orig.jpg',
      genreIds: moviedb.genres.map((e) => e.name).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
        ? 'https://images.tmdb.org/t/p/w500${ moviedb.posterPath }'
        : 'https://www.jakartaplayers.org/uploads/1/2/5/5/12551960/2297419_orig.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
  );
}
