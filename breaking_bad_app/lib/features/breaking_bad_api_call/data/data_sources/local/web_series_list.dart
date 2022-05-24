import 'package:breaking_bad_app/features/breaking_bad_api_call/data/models/web_series_model.dart';
import 'package:breaking_bad_app/utils/constants.dart';

List<WebSeriesModel> webSeriesList = [
  WebSeriesModel(
      seriesName:breakingBadSeriesName ,
      description: breakingBadDescription,
      genre: breakingBadGenres,
      image: 'img/breaking_bad.jpg',rating: 5),
  WebSeriesModel(
      seriesName:betterCallSaulSeriesName,
      description: betterCallSaulDescription,
      genre: betterCallSaulGenres,
      image: 'img/better_call_saul.jpg',rating: 4)
];
