// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  String categoryName;
  List<Content> content;

  Category({
    required this.categoryName,
    required this.content,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
      };
}

class Content {
  String name;
  String description;

  Content({
    required this.name,
    required this.description,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
