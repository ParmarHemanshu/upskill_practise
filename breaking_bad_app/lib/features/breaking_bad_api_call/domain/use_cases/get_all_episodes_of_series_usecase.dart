import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/repositories/breaking_bad_api_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../entities/episode_entity.dart';

class GetAllEpisodesOfSeriesUseCase{
  final BreakingBadApiRepository breakingBadApiRepository;

  GetAllEpisodesOfSeriesUseCase({required this.breakingBadApiRepository});

  Future<Either<Failures,List<EpisodeEntity>>> call(String seriesName) async{
    return await breakingBadApiRepository.getAllEpisodesOfSeries(seriesName);
  }
}
