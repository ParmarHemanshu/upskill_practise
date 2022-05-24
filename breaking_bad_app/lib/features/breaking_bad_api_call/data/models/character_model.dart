import 'dart:convert';

import 'package:breaking_bad_app/features/breaking_bad_api_call/domain/entities/character_entity.dart';

/// char_id : 1
/// name : "Walter White"
/// birthday : "09-07-1958"
/// occupation : ["High School Chemistry Teacher","Meth King Pin"]
/// img : "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg"
/// status : "Deceased"
/// appearance : [1,2,3,4,5]
/// nickname : "Heisenberg"
/// portrayed : "Bryan Cranston"

CharacterModel characterModelFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel extends CharacterEntity {
  CharacterModel({
    int? charId,
    String? name,
    String? birthday,
    List<String>? occupation,
    String? img,
    String? status,
    List<int>? appearance,
    String? nickname,
    String? portrayed,
  }) {
    _charId = charId;
    _name = name;
    _birthday = birthday;
    _occupation = occupation;
    _img = img;
    _status = status;
    _appearance = appearance;
    _nickname = nickname;
    _portrayed = portrayed;
  }

  int? _charId;
  String? _name;
  String? _birthday;
  List<String>? _occupation;
  String? _img;
  String? _status;
  List<int>? _appearance;
  String? _nickname;
  String? _portrayed;

  int? get charId => _charId;

  String? get name => _name;

  String? get birthday => _birthday;

  List<String>? get occupation => _occupation;

  String? get img => _img;

  String? get status => _status;

  List<int>? get appearance => _appearance;

  String? get nickname => _nickname;

  String? get portrayed => _portrayed;

  CharacterModel.fromJson(dynamic json) {
    _charId = json['char_id'];
    _name = json['name'];
    _birthday = json['birthday'];
    _occupation =
        json['occupation'] != null ? json['occupation'].cast<String>() : [];
    _img = json['img'];
    _status = json['status'];
    _appearance =
        json['appearance'] != null ? json['appearance'].cast<int>() : [];
    _nickname = json['nickname'];
    _portrayed = json['portrayed'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['char_id'] = _charId;
    map['name'] = _name;
    map['birthday'] = _birthday;
    map['occupation'] = _occupation;
    map['img'] = _img;
    map['status'] = _status;
    map['appearance'] = _appearance;
    map['nickname'] = _nickname;
    map['portrayed'] = _portrayed;
    return map;
  }

  CharacterModel copyWith({
    int? charId,
    String? name,
    String? birthday,
    List<String>? occupation,
    String? img,
    String? status,
    List<int>? appearance,
    String? nickname,
    String? portrayed,
  }) =>
      CharacterModel(
        charId: charId ?? _charId,
        name: name ?? _name,
        birthday: birthday ?? _birthday,
        occupation: occupation ?? _occupation,
        img: img ?? _img,
        status: status ?? _status,
        appearance: appearance ?? _appearance,
        nickname: nickname ?? _nickname,
        portrayed: portrayed ?? _portrayed,
      );
}
