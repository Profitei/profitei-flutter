import 'package:equatable/equatable.dart';

import '../category/category.dart';
import 'property.dart';
import 'ticket.dart';

class Raffle extends Equatable{
  final int id;
  final String name;
  final String image;
  final double price;
  final int categoryId;
  final String status;
  final DateTime created;
  final DateTime modified;
  final Category category;
  final List<Property> properties;
  final List<Ticket> tickets;

  const Raffle({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.categoryId,
    required this.status,
    required this.created,
    required this.modified,
    required this.category,
    required this.properties,
    required this.tickets,
  });

    @override
  List<Object?> get props => [id];
}
