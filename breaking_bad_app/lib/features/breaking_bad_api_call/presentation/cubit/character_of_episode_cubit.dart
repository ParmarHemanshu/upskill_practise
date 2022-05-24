import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/use_cases/get_characters_of_episode_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/character_entity.dart';

part 'character_of_episode_state.dart';

class CharacterOfEpisodeCubit extends Cubit<CharacterOfEpisodeState> {
  CharacterOfEpisodeCubit({required this.getAllCharactersOfEpisodeUseCase})
      : super(CharacterOfEpisodeInitial());
  final GetAllCharactersOfEpisodeUseCase getAllCharactersOfEpisodeUseCase;

  void getAllCharacterDetails(int episodeId) async {
    emit(CharacterOfEpisodeLoading());
    try {
      final response = await getAllCharactersOfEpisodeUseCase.call(episodeId);
      response.fold((failure) => failure.debugPrintFailure(failure.toString()), (charList) {
        emit(CharacterOfEpisodeLoaded(charList: charList));
      });
    } catch (error) {
      emit(CharacterOfEpisodeError(errorMsg:error.toString()));
    }
  }
}
