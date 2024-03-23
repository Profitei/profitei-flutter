
import 'package:profitei_flutter/domain/entities/raffle/property.dart';

class PropertyModel extends Property{
  PropertyModel({
    required super.id,
    required super.name,
    required super.value, 
    required super.raffleId,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      name: json['name'],
      value: json['value'], 
      raffleId: json['raffle_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'raffle_id': raffleId,
    };
  }

  factory PropertyModel.fromEntity(Property entity) {
    return PropertyModel(
      id: entity.id,
      name: entity.name,
      value: entity.value,
      raffleId: entity.raffleId,
    );
  }
}