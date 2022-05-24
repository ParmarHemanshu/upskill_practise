import 'package:breaking_bad_app/features/breaking_bad_api_call/data/models/web_series_model.dart';
import 'package:breaking_bad_app/features/breaking_bad_api_call/presentation/widgets/rating_view.dart';
import 'package:breaking_bad_app/utils/app_colors.dart';
import 'package:breaking_bad_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../pages/episodes_page.dart';

class SeriesHomePageView extends StatelessWidget {
  const SeriesHomePageView({Key? key, required this.webSeriesModel}) : super(key: key);
final WebSeriesModel webSeriesModel;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(webSeriesModel.image!)),
            const SizedBox(height: 20),
            Text(webSeriesModel.seriesName!,
                style: AppTextStyles.seriesNameTextStyle),
            const SizedBox(height: 10),
            Text(webSeriesModel.description!,
                style: AppTextStyles.infoContentStyle),
            const SizedBox(height: 10),
            Text(webSeriesModel.genre!,
                style: AppTextStyles.infoContentStyle),
            const SizedBox(height: 10),
            SizedBox(
                height: 60,
                child: RatingView(rating: webSeriesModel.rating!)),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EpisodesPage(
                                      seriesName: webSeriesModel.seriesName!,
                                    )));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryGreen),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                      ),
                      child: const Text('View Episodes')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
