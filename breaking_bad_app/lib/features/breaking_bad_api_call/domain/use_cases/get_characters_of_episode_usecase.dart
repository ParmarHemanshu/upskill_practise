import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/entities/character_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../repositories/breaking_bad_api_repository.dart';

class GetAllCharactersOfEpisodeUseCase{
  final BreakingBadApiRepository breakingBadApiRepository;

  GetAllCharactersOfEpisodeUseCase({required this.breakingBadApiRepository});

  Future<Either<Failures,List<CharacterEntity>>> call(int episodeId) async{
    return await breakingBadApiRepository.getAllCharactersOfEpisode(episodeId);
  }
}