// To parse this JSON data, do
//
//     final userCard = userCardFromJson(jsonString);

import 'dart:convert';

List<UserCard> userCardFromJson(String str) =>
    List<UserCard>.from(json.decode(str).map((x) => UserCard.fromJson(x)));

String userCardToJson(List<UserCard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCard {
  String id;
  String number;
  String name;
  String date;
  int cvv;

  UserCard({
    required this.id,
    required this.number,
    required this.name,
    required this.date,
    required this.cvv,
  });

  factory UserCard.fromJson(Map<String, dynamic> json) => UserCard(
        id: json["id"],
        number: json["number"],
        name: json["name"],
        date: json["date"],
        cvv: json["cvv"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "name": name,
        "date": date,
        "cvv": cvv,
      };
}
