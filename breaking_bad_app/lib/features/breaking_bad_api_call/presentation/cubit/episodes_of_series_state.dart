part of 'episodes_of_series_cubit.dart';

abstract class EpisodesOfSeriesState extends Equatable {
  const EpisodesOfSeriesState();
}

class EpisodesOfSeriesInitial extends EpisodesOfSeriesState {
  @override
  List<Object> get props => [];
}
class EpisodesOfSeriesLoading extends EpisodesOfSeriesState {
  @override
  List<Object> get props => [];
}
class EpisodesOfSeriesLoaded extends EpisodesOfSeriesState {
  final List<EpisodeEntity>? episodeList;

  const EpisodesOfSeriesLoaded({this.episodeList});

  @override
  List<Object> get props => [episodeList!];

}
class EpisodesOfSeriesError extends EpisodesOfSeriesState {
  final String errorMsg;
  const EpisodesOfSeriesError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
