class LocationModel {
  LocationModel({name, dimension});

  String? name;
  String? dimension;

  LocationModel.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    dimension = map["dimension"];
  }
}
