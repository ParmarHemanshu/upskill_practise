// ignore_for_file: overridden_fields

import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/entities/web_series_entity.dart';

class WebSeriesModel extends WebSeriesEntity {
  WebSeriesModel(
      {this.seriesName, this.description, this.genre, this.image, this.rating});

  String? seriesName;
  String? description;
  String? genre;
  String? image;
  int? rating;

  @override
  String toString() {
    return 'WebSeriesModel{seriesName: $seriesName, description: $description, genre: $genre, image: $image, rating: $rating}';
  }
}
