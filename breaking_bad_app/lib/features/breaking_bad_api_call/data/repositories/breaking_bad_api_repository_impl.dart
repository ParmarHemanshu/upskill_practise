import 'package:breaking_bad_app/core/failures/failures.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/data/data_sources/remote/breaking_bad_api_data_source.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/data/models/character_model.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/data/models/episode_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/breaking_bad_api_repository.dart';

class BreakingBadApiRepositoryImpl implements BreakingBadApiRepository {
  final BreakingBadApiDataSource breakingBadApiDataSource;

  BreakingBadApiRepositoryImpl({required this.breakingBadApiDataSource});

  @override
  Future<Either<Failures, List<EpisodeModel>>> getAllEpisodesOfSeries(
      String seriesName) async {
    return await breakingBadApiDataSource.getAllEpisodesOfSeries(seriesName);
  }

  @override
  Future<Either<Failures, List<CharacterModel>>> getAllCharactersOfEpisode(
      int episodeId) async {
    return await breakingBadApiDataSource.getAllCharactersOfEpisode(episodeId);
  }
}
