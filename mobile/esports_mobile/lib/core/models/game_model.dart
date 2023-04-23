import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameModel {
  String name;
  String pathImage;
  GameModel({
    required this.name,
    required this.pathImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'pathImage': pathImage,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      name: map['name'] as String,
      pathImage: map['pathImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
