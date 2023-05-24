// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
    final int id;
    final String name;
    final String about;

    ItemModel({
        required this.id,
        required this.name,
        required this.about,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["_id"],
        name: json["name"],
        about: json["about"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "about": about,
    };
}
