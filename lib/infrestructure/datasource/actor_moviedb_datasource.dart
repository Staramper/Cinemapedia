import 'package:cinemapedia/domain/datasource/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';
import '../../config/constants/environment.dart';
import '../mappers/actor_mapper.dart';

class ActorMoviedbDatasource extends ActorsDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX',
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{

    final response = await dio.get('/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = creditsResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();
    
    return actors;
  }



}