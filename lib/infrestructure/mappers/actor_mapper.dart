
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrestructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => 
  Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null
    ? 'https://images.tmdb.org/t/p/w500${ cast.profilePath }'
    : 'https://img.freepik.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4195.jpg?semt=ais_incoming',
    character: cast.character
  );

}