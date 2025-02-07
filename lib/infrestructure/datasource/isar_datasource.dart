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
  Future<bool> isMovieFavorite(int movieId) {
    // TODO: implement isMovieFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 10, offset = 0}) {
    // TODO: implement loadMovie
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }

}