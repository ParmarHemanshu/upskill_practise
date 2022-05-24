class CharacterEntity{

  CharacterEntity({
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
}
