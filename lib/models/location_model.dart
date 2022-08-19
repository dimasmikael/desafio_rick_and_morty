
class LocationModel {
  LocationModel({

 name,
    dimension
    // required this.status,
    // required this.species,
    // required this.type,
    // required this.gender,
    // // required this.origin,
    // // required this.location,
    // required this.image,
    // required this.episode,

    // required this.created,
  });


  String? name;String? dimension;
  // final String status;
  // final String species;
  // final String type;
  // final String gender;
  // // final CharacterLocation origin;
  // // final CharacterLocation location;

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



  LocationModel.fromMap(Map<String, dynamic> map) {

    name = map["name"];dimension = map["dimension"];

  }
}

