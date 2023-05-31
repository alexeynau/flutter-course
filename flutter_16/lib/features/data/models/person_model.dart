// To parse this JSON data, do
//
//     final personModel = personModelFromJson(jsonString);

import 'dart:convert';

List<PersonModel> personModelFromJson(String str) => List<PersonModel>.from(json.decode(str).map((x) => PersonModel.fromJson(x)));

String personModelToJson(List<PersonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonModel {
    final String photo;
    final String name;
    final String email;

    PersonModel({
        required this.photo,
        required this.name,
        required this.email,
    });

    factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        photo: json["photo"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "photo": photo,
        "name": name,
        "email": email,
    };
}