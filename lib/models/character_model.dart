import 'dart:convert';

import 'package:desafio_rick_and_morty/models/location_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    // required this.species,
    // required this.type,
    required this.gender,
    // // required this.origin,
    // // required this.location,
    required this.image,
    // required this.episode,

    // required this.created,
  });

  int? id;
  String? name;
  LocationModel? location;
  String? status;
  // final String species;
  // final String type;
  String? gender;
  // // final CharacterLocation origin;
  // // final CharacterLocation location;
  String? image;
  // final List<String> episode;

  // final DateTime created;

  // factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
  //   id: json["id"],
  //   name: json["name"],
  //   // status: json["status"],
  //   // species: json["species"],
  //   // type: json["type"],
  //   // gender: json["gender"],
  //   // // origin: CharacterLocation.fromJson(json["origin"]),
  //   // // location: CharacterLocation.fromJson(json["location"]),
  //    image: json["image"],
  //   // episode: List<String>.from(json["episode"].map((x) => x)),
  //    url: json["url"],
  //   // created: DateTime.parse(json["created"]),
  // );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "status": status,
        // "species": species,
        // "type": type,
        // "gender": gender,
        // // "origin": origin.toJson(),
        // // "location": location.toJson(),
        "image": image,
        // "episode": List<dynamic>.from(episode.map((x) => x)),

        // "created": created.toIso8601String(),
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
        (character) => {characters.add(CharacterModel.fromMap(character))});

    return characters;
  }

  CharacterModel.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    gender = map["gender"];
    image = map["image"];
    status = map["status"];

    if (map["location"] != null) {
      this.location = LocationModel.fromMap(
        map["location"],
      );
    }
  }
}
