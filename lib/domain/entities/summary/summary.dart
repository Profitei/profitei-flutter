import 'package:equatable/equatable.dart';

class RaffleSummary extends Equatable {
  final int id;
  final String name;
  final String image;
  final double price;

  const RaffleSummary({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });
  
  @override
  List<Object?> get props => [id];

}