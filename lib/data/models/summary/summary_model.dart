import 'dart:convert';

import 'package:profitei_flutter/domain/entities/summary/summary.dart';

class RaffleSummaryModel extends RaffleSummary {
  const RaffleSummaryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
  });

  factory RaffleSummaryModel.fromJson(Map<String, dynamic> json) {
    return RaffleSummaryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  factory RaffleSummaryModel.fromEntity(RaffleSummary entity) {
    return RaffleSummaryModel(
      id: entity.id,
      name: entity.name,
      image: entity.image,
      price: entity.price,
    );
  }
}

List<RaffleSummaryModel> summaryModelListFromRemoteJson(String str) =>
    List<RaffleSummaryModel>.from(
        json.decode(str).map((x) => RaffleSummaryModel.fromJson(x)));
