import 'dart:convert';
/// episode_id : 5
/// title : "Gray Matter"
/// season : "1"
/// air_date : "02-24-2008"
/// characters : ["Walter White","Jesse Pinkman","Skyler White","Hank Schrader","Marie Schrader","Walter White Jr.","Elliott Schwarts","Gretchen Swartz","Badger"]
/// episode : "5"
/// series : "Breaking Bad"

ResponseEpisodeModel responseEpisodeModelFromJson(String str) => ResponseEpisodeModel.fromJson(json.decode(str));
String responseEpisodeModelToJson(ResponseEpisodeModel data) => json.encode(data.toJson());
class ResponseEpisodeModel {
  ResponseEpisodeModel({
      int? episodeId, 
      String? title, 
      String? season, 
      String? airDate, 
      List<String>? characters, 
      String? episode, 
      String? series,}){
    _episodeId = episodeId;
    _title = title;
    _season = season;
    _airDate = airDate;
    _characters = characters;
    _episode = episode;
    _series = series;
}

  ResponseEpisodeModel.fromJson(dynamic json) {
    _episodeId = json['episode_id'];
    _title = json['title'];
    _season = json['season'];
    _airDate = json['air_date'];
    _characters = json['characters'] != null ? json['characters'].cast<String>() : [];
    _episode = json['episode'];
    _series = json['series'];
  }
  int? _episodeId;
  String? _title;
  String? _season;
  String? _airDate;
  List<String>? _characters;
  String? _episode;
  String? _series;
ResponseEpisodeModel copyWith({  int? episodeId,
  String? title,
  String? season,
  String? airDate,
  List<String>? characters,
  String? episode,
  String? series,
}) => ResponseEpisodeModel(  episodeId: episodeId ?? _episodeId,
  title: title ?? _title,
  season: season ?? _season,
  airDate: airDate ?? _airDate,
  characters: characters ?? _characters,
  episode: episode ?? _episode,
  series: series ?? _series,
);
  int? get episodeId => _episodeId;
  String? get title => _title;
  String? get season => _season;
  String? get airDate => _airDate;
  List<String>? get characters => _characters;
  String? get episode => _episode;
  String? get series => _series;

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

}