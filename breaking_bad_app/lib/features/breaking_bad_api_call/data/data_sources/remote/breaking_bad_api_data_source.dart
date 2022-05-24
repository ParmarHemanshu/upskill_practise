import 'package:breaking_bad_app/features/breaking_bad_api_call/data/models/character_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failures/failures.dart';
import '../../models/episode_model.dart';

abstract class BreakingBadApiDataSource{
  Future<Either<Failures,List<EpisodeModel>>> getAllEpisodesOfSeries(String seriesName);
  Future<Either<Failures, List<CharacterModel>>> getAllCharactersOfEpisode(int episodeId);

}