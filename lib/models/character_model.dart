import 'dart:convert';
import 'package:desafio_rick_and_morty/models/location_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.image,
  });

  int? id;
  String? name;
  LocationModel? location;
  String? status;

  String? gender;

  String? image;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };

  static List<CharacterModel> createCharactersFromArray(
      String queryName, QueryResult resultado) {
    String encoded = jsonEncode(resultado.data);
    Map<String, dynamic> map = json.decode(encoded);
    List<CharacterModel> characters = [];

    if (resultado.hasException) {
      print(resultado.exception);
    }

    map[queryName]['results'].forEach(
      (character) => {
        characters.add(
          CharacterModel.fromMap(character),
        ),
      },
    );

    return characters;
  }

  CharacterModel.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    gender = map["gender"];
    image = map["image"];
    status = map["status"];

    if (map["location"] != null) {
      location = LocationModel.fromMap(
        map["location"],
      );
    }
  }
}
