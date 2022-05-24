import 'package:breaking_bad_app/features/breaking_bad_api_call/presentation/cubit/episodes_of_series_cubit.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/presentation/pages/episode_details_page.dart';
import 'package:breaking_bad_app/utils/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../breaking_bad_injection_container.dart';
import '../../domain/use_cases/get_all_episodes_of_series_usecase.dart';

class EpisodesPage extends StatelessWidget {
  EpisodesPage({Key? key, required this.seriesName}) : super(key: key);

  final String seriesName;
  final episodesCubit = EpisodesOfSeriesCubit(
      getAllEpisodesOfSeriesUseCase: sl<GetAllEpisodesOfSeriesUseCase>());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(seriesName),
          ),
      body: BlocBuilder<EpisodesOfSeriesCubit, EpisodesOfSeriesState>(
          bloc: episodesCubit,
          builder: (context, state) {
            if (state is EpisodesOfSeriesInitial) {
              episodesCubit.getAllEpisodes(seriesName);
              return const LoadingWidget();
            } else if (state is EpisodesOfSeriesLoading) {
              return const LoadingWidget();
            } else if (state is EpisodesOfSeriesLoaded) {
              final episodeList = state.episodeList;
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
                      itemCount: episodeList!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EpisodeDetailsPage(
                                      episode: episodeList[index],
                                    )));
                          },

                          child: Container(
                            color: Colors.blue,
                            child: Column(
                              children: [
                                Text('Season :'+episodeList[index].season!),
                                Text('Episode :'+episodeList[index].episode!),
                                Text('Title :'+episodeList[index].title!),
                                Text('Release :'+episodeList[index].airDate!),

                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            } else if (state is EpisodesOfSeriesError) {
              return const Center(
                  child: Text('Error while fetching all episodes'));
            } else {
              return const SizedBox.shrink();
            }
          }),
    ));
  }
}
