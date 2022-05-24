
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/episode_entity.dart';
import '../../domain/use_cases/get_all_episodes_of_series_usecase.dart';

part 'episodes_of_series_state.dart';

class EpisodesOfSeriesCubit extends Cubit<EpisodesOfSeriesState> {
  EpisodesOfSeriesCubit({required this.getAllEpisodesOfSeriesUseCase})
      : super(EpisodesOfSeriesInitial());
  final GetAllEpisodesOfSeriesUseCase getAllEpisodesOfSeriesUseCase;

  void getAllEpisodes(String seriesName) async {
    emit(EpisodesOfSeriesLoading());
    try {
      final response = await getAllEpisodesOfSeriesUseCase.call(seriesName);
      response.fold((failure) => failure.debugPrintFailure(failure.toString()), (episodeList) {
        emit(EpisodesOfSeriesLoaded(episodeList:episodeList ));
      });
    } catch (error) {
      emit(EpisodesOfSeriesError(errorMsg: error.toString()));
    }
  }
}
