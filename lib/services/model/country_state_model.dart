// To parse this JSON data, do
//
//     final countryStateModel = countryStateModelFromMap(jsonString);

import 'dart:convert';

CountryStateModel countryStateModelFromMap(String str) => CountryStateModel.fromMap(json.decode(str));

String countryStateModelToMap(CountryStateModel data) => json.encode(data.toMap());

class CountryStateModel {
  List<States> states;
  List<Province> provinces;

  CountryStateModel({
    required this.states,
    required this.provinces,
  });

  factory CountryStateModel.fromMap(Map<String, dynamic> json) => CountryStateModel(
    states: List<States>.from(json["states"].map((x) => States.fromMap(x))),
    provinces: List<Province>.from(json["provinces"].map((x) => Province.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "states": List<dynamic>.from(states.map((x) => x.toMap())),
    "provinces": List<dynamic>.from(provinces.map((x) => x.toMap())),
  };
}

class Province {
  int id;
  int stateId;
  String name;

  Province({
    required this.id,
    required this.stateId,
    required this.name,
  });

  factory Province.fromMap(Map<String, dynamic> json) => Province(
    id: json["id"],
    stateId: json["state_id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "state_id": stateId,
    "name": name,
  };
}

class States {
  int id;
  String name;

  States({
    required this.id,
    required this.name,
  });

  factory States.fromMap(Map<String, dynamic> json) => States(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
