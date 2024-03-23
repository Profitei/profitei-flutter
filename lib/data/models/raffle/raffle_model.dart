import 'dart:convert';

import '../../../domain/entities/raffle/raffle.dart';
import '../category/category_model.dart';
import 'property_model.dart';
import 'ticket_model.dart';

class RaffleModel extends Raffle {
  const RaffleModel({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    required super.categoryId,
    required super.status,
    required super.created,
    required super.modified,
    required CategoryModel super.category,
    required List<PropertyModel> super.properties,
    required List<TicketModel> super.tickets,
  });

  factory RaffleModel.fromJson(Map<String, dynamic> json) => RaffleModel(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        categoryId: json["category_id"],
        status: json["status"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        category: CategoryModel.fromJson(json["category"]),
        properties: List<PropertyModel>.from(
            json["properties"].map((x) => PropertyModel.fromJson(x))),
        tickets: List<TicketModel>.from(
            json["tickets"].map((x) => TicketModel.fromJson(x))),
      );
      
    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "price": price,
        "category_id": categoryId,
        "status": status,
        "created": created.toIso8601String(),
        "modified": modified.toIso8601String(),
        "category": (category as CategoryModel).toJson(),
        "properties": List<dynamic>.from(
            (properties as List<PropertyModel>).map((x) => x.toJson())),
        "tickets": List<dynamic>.from(
            (tickets as List<TicketModel>).map((x) => x.toJson())),
      };

      factory RaffleModel.fromEntity(Raffle entity) => RaffleModel(
        id: entity.id,
        name: entity.name,
        image: entity.image,
        price: entity.price,
        categoryId: entity.categoryId,
        status: entity.status,
        created: entity.created,
        modified: entity.modified,
        category: CategoryModel.fromEntity(entity.category),
        properties: entity.properties
            .map((property) => PropertyModel.fromEntity(property))
            .toList(),
        tickets: entity.tickets
            .map((ticket) => TicketModel.fromEntity(ticket))
            .toList(),
      );
}

RaffleModel raffleModelFromRemoteJson(String str) =>
    RaffleModel.fromJson(json.decode(str));