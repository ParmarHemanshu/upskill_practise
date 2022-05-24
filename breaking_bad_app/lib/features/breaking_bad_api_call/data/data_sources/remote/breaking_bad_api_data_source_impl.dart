import 'dart:convert';
import 'dart:io';

import 'package:breaking_bad_app/core/failures/exceptions.dart';
import 'package:breaking_bad_app/core/failures/failures.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/data/models/character_model.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/data/models/episode_model.dart';
import 'package:breaking_bad_app/utils/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'breaking_bad_api_data_source.dart';

class BreakingBadDataSourceImpl implements BreakingBadApiDataSource {
  final Dio apiClient;

  BreakingBadDataSourceImpl({required this.apiClient});

  @override
  Future<Either<Failures, List<EpisodeModel>>> getAllEpisodesOfSeries(
      String seriesName) async {
    try {
      final response = await apiClient.get('$breakingBadApiBaseUrl/episodes',
          queryParameters: {'series': seriesName});
      if (response.statusCode == 200) {
        final episodesList = <EpisodeModel>[];
        final jsonList = response.data;
        for (var item in jsonList) {
          episodesList.add(EpisodeModel.fromJson(item));
        }
        return Right(episodesList);
      } else {
        return Left(ServerException());
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        throw SocketException(error.message);
      }
    } catch (exception) {
      throw ServerException(exception: exception.toString());
    }
    return Left(ServerException(exception: 'getAllEpisodesOfSeries : failed to get all episode of series.'));
  }

  @override
  Future<Either<Failures, List<CharacterModel>>> getAllCharactersOfEpisode(
      int episodeId) async {
    final response = await _getDetailsOfEpisode(episodeId);
    List<CharacterModel> filteredCharacters = [];
    await response.fold(
        (error) => error.debugPrintFailure(
            'getDetailsOfEpisode : failed to get episode details.'),
        (selectedEpisode) async {
      final all_char_response = await _getAllCharacters();
      all_char_response.fold(
          (error) => error.debugPrintFailure(
              'getAllCharacters : failed to get All character details'),
          (charList) {
        selectedEpisode.characters?.forEach((charNameInEpisode) {
          for (var charModel in charList) {
            if (charModel.name == charNameInEpisode) {
              filteredCharacters.add(CharacterModel(
                  charId: charModel.charId,
                  appearance: charModel.appearance,
                  birthday: charModel.birthday,
                  img: charModel.img,
                  name: charModel.name,
                  nickname: charModel.nickname,
                  portrayed: charModel.portrayed,
                  status: charModel.status));
            }
          }
        });
        return Right(filteredCharacters);
      });
    });
    return Left(ServerException(exception: 'getAllCharactersOfEpisode : failed to get character data.'));
  }

  Future<Either<Failures, EpisodeModel>> _getDetailsOfEpisode(
      int episodeId) async {
    try {
      final response =
          await apiClient.get('$breakingBadApiBaseUrl/episodes/$episodeId');
      if (response.statusCode == 200) {
        final episodeModel = EpisodeModel.fromJson(response.data);
        return Right(episodeModel);
      } else {
        return Left(ServerException());
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        throw SocketException(error.message);
      }
    } catch (exception) {
      throw ServerException(exception: exception.toString());
    }
    return Left(ServerException());
  }

  Future<Either<Failures, List<CharacterModel>>> _getAllCharacters() async {
    try {
      final response = await apiClient.get('$breakingBadApiBaseUrl/characters');
      if (response.statusCode == 200) {
        final charList = <CharacterModel>[];
        final jsonList = response.data as List;
        for (var item in jsonList) {
          charList.add(CharacterModel.fromJson(item));
        }
        return Right(charList);
      } else {
        return Left(ServerException());
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        throw SocketException(error.message);
      }
    } catch (exception) {
      throw ServerException(exception: exception.toString());
    }
    return Left(ServerException());
  }
}
