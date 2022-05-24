import 'package:breaking_bad_app/features/breaking_bad_api_call/data/data_sources/remote/breaking_bad_api_data_source_impl.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/data/repositories/breaking_bad_api_repository_impl.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/use_cases/get_all_episodes_of_series_usecase.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/use_cases/get_characters_of_episode_usecase.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/presentation/cubit/character_of_episode_cubit.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/presentation/cubit/episodes_of_series_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/remote/breaking_bad_api_data_source.dart';
import 'domain/repositories/breaking_bad_api_repository.dart';

final sl = GetIt.instance;

Future<void> initalizeBreakingBadApiFeature() async {

//data source  
sl.registerLazySingleton<BreakingBadApiDataSource>(() => BreakingBadDataSourceImpl(apiClient: sl()))  ;

//repository
sl.registerLazySingleton<BreakingBadApiRepository>(() => BreakingBadApiRepositoryImpl(breakingBadApiDataSource: sl()));


//use cases
  sl.registerFactory<GetAllCharactersOfEpisodeUseCase>(() => GetAllCharactersOfEpisodeUseCase(breakingBadApiRepository: sl()));
  sl.registerFactory<GetAllEpisodesOfSeriesUseCase>(() => GetAllEpisodesOfSeriesUseCase(breakingBadApiRepository: sl()));
  
  
//cubit
sl.registerFactory<CharacterOfEpisodeCubit>(() => CharacterOfEpisodeCubit(getAllCharactersOfEpisodeUseCase: sl()));
sl.registerFactory<EpisodesOfSeriesCubit>(() => EpisodesOfSeriesCubit(getAllEpisodesOfSeriesUseCase: sl()));


//external
  sl.registerLazySingleton(() => Dio());
}
