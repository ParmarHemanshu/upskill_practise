part of 'character_of_episode_cubit.dart';

abstract class CharacterOfEpisodeState extends Equatable {
  const CharacterOfEpisodeState();
}

class CharacterOfEpisodeInitial extends CharacterOfEpisodeState {
  @override
  List<Object> get props => [];
}
class CharacterOfEpisodeLoading extends CharacterOfEpisodeState {
  @override
  List<Object> get props => [];
}
class CharacterOfEpisodeLoaded extends CharacterOfEpisodeState {

  final List<CharacterEntity>? charList;
   const CharacterOfEpisodeLoaded({this.charList});

  @override
  List<Object> get props => [charList!];
}
class CharacterOfEpisodeError extends CharacterOfEpisodeState {
  final String errorMsg;
  const CharacterOfEpisodeError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
