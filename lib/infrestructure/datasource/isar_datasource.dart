import 'package:cinemapedia/domain/datasource/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {

  late Future<Isar> db;

  IsarDatasource() {
    db = openBD();
  }

  Future<Isar> openBD() async{
    final dir = await getApplicationDocumentsDirectory();
    if( Isar.instanceNames.isEmpty ) {
      return await Isar.open(
        [MovieSchema],
        directory: dir.path,
        inspector: true,
        );
  }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;

    final Movie? isFavoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movieId)
      .findFirst();

    return isFavoriteMovie != null;

  }

  @override
  Future<List<Movie>> loadMovie({int limit = 10, offset = 0}) async {
    final isar = await db;

    final movies = await isar.movies
      .where()
      .findAll();
    
    return movies.skip(offset).take(limit).toList();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;

    final favoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movie.id)
      .findFirst();

    if( favoriteMovie != null ) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }

    isar.writeTxnSync(() => isar.movies.putSync(movie));

  }

}