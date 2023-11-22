// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  String model;
  int pk;
  Fields fields;

  Item({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int amount;
  String description;
  int price;
  DateTime dateAdded;
  String purchasedFrom;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.description,
    required this.price,
    required this.dateAdded,
    required this.purchasedFrom,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        price: json["price"],
        dateAdded: DateTime.parse(json["date_added"]),
        purchasedFrom: json["purchased_from"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
        "price": price,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "purchased_from": purchasedFrom,
      };
}
