import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/entities/episode_entity.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/use_cases/get_characters_of_episode_usecase.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/presentation/cubit/character_of_episode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/widgets/loading_widget.dart';
import '../../breaking_bad_injection_container.dart';


class EpisodeDetailsPage extends StatelessWidget {
    EpisodeDetailsPage({Key? key, required this.episode}) : super(key: key);
final EpisodeEntity episode;
final characterCubit=CharacterOfEpisodeCubit(getAllCharactersOfEpisodeUseCase: sl<GetAllCharactersOfEpisodeUseCase>());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(episode.title!),
          ),
          body: BlocBuilder<CharacterOfEpisodeCubit, CharacterOfEpisodeState>(
              bloc: characterCubit,
              builder: (context, state) {
                if (state is CharacterOfEpisodeInitial) {
                  characterCubit.getAllCharacterDetails(1);
                  return const LoadingWidget();
                } else if (state is CharacterOfEpisodeLoading) {
                  return const LoadingWidget();
                } else if (state is CharacterOfEpisodeLoaded) {
                  final charList = state.charList;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: charList!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.blue,
                              child: Text("index: ${charList[index]}"),
                            );
                          },
                        )
                      ],
                    ),
                  );
                } else if (state is CharacterOfEpisodeError) {
                  return const Center(
                      child: Text('Error while fetching character details.'));
                } else {
                  return const SizedBox.shrink();
                }
              }),
        ));
  }
}
