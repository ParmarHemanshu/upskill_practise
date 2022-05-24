import 'package:breaking_bad_app/features/breaking_bad_api_call/data/models/character_model.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/entities/character_entity.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/entities/episode_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';


abstract class BreakingBadApiRepository{
  Future<Either<Failures,List<EpisodeEntity>>> getAllEpisodesOfSeries(String seriesName);
  Future<Either<Failures,List<CharacterEntity>>> getAllCharactersOfEpisode(int episodeId);
}