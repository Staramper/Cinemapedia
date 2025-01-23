import 'package:cinemapedia/infrestructure/datasource/actor_moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infrestructure/repositories/actor_repository_impl.dart';


// Este repositorio es inmutable
final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMoviedbDatasource() );
});