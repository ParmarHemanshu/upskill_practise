import 'dart:convert';

import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/entities/episode_entity.dart';

/// episode_id : 63
/// title : "Uno"
/// season : "1"
/// air_date : "02-08-2015"
/// characters : ["Jimmy McGill","Mike Erhmantraut","Kim Wexler","Howard Hamlin","Chuck McGill","Nacho Varga"]
/// episode : "1"
/// series : "Better Call Saul"

EpisodeModel episodeModelFromJson(String str) =>
    EpisodeModel.fromJson(json.decode(str));

String episodeModelToJson(EpisodeModel data) => json.encode(data.toJson());

class EpisodeModel extends EpisodeEntity {
  EpisodeModel({
    int? episodeId,
    String? title,
    String? season,
    String? airDate,
    List<String>? characters,
    String? episode,
    String? series,
  }) {
    _episodeId = episodeId;
    _title = title;
    _season = season;
    _airDate = airDate;
    _characters = characters;
    _episode = episode;
    _series = series;
  }

  int? _episodeId;
  String? _title;
  String? _season;
  String? _airDate;
  List<String>? _characters;
  String? _episode;
  String? _series;

  int? get episodeId => _episodeId;

  String? get title => _title;

  String? get season => _season;

  String? get airDate => _airDate;

  List<String>? get characters => _characters;

  String? get episode => _episode;

  String? get series => _series;

  EpisodeModel.fromJson(dynamic json) {
    _episodeId = json['episode_id'];
    _title = json['title'];
    _season = json['season'];
    _airDate = json['air_date'];
    _characters =
        json['characters'] != null ? json['characters'].cast<String>() : [];
    _episode = json['episode'];
    _series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['episode_id'] = _episodeId;
    map['title'] = _title;
    map['season'] = _season;
    map['air_date'] = _airDate;
    map['characters'] = _characters;
    map['episode'] = _episode;
    map['series'] = _series;
    return map;
  }

  EpisodeModel copyWith({
    int? episodeId,
    String? title,
    String? season,
    String? airDate,
    List<String>? characters,
    String? episode,
    String? series,
  }) =>
      EpisodeModel(
        episodeId: episodeId ?? _episodeId,
        title: title ?? _title,
        season: season ?? _season,
        airDate: airDate ?? _airDate,
        characters: characters ?? _characters,
        episode: episode ?? _episode,
        series: series ?? _series,
      );
}

class EpisodeGetModel extends EpisodeEntity {
  EpisodeGetModel({
    String? episodeId,
    String? title,
    String? season,
    String? airDate,
    List<String>? characters,
    String? episode,
    String? series,
  }) {
    _episodeId = episodeId;
    _title = title;
    _season = season;
    _airDate = airDate;
    _characters = characters;
    _episode = episode;
    _series = series;
  }

  String? _episodeId;
  String? _title;
  String? _season;
  String? _airDate;
  List<String>? _characters;
  String? _episode;
  String? _series;

  String? get title => _title;

  String? get season => _season;

  String? get airDate => _airDate;

  List<String>? get characters => _characters;

  String? get episode => _episode;

  String? get series => _series;

  EpisodeGetModel.fromJson(dynamic json) {
    _episodeId = json['episode_id'];
    _title = json['title'];
    _season = json['season'];
    _airDate = json['air_date'];
    _characters =
        json['characters'] != null ? json['characters'].cast<String>() : [];
    _episode = json['episode'];
    _series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['episode_id'] = _episodeId;
    map['title'] = _title;
    map['season'] = _season;
    map['air_date'] = _airDate;
    map['characters'] = _characters;
    map['episode'] = _episode;
    map['series'] = _series;
    return map;
  }

  EpisodeGetModel copyWith({
    String? episodeId,
    String? title,
    String? season,
    String? airDate,
    List<String>? characters,
    String? episode,
    String? series,
  }) =>
      EpisodeGetModel(
        episodeId: episodeId ?? _episodeId,
        title: title ?? _title,
        season: season ?? _season,
        airDate: airDate ?? _airDate,
        characters: characters ?? _characters,
        episode: episode ?? _episode,
        series: series ?? _series,
      );
}
