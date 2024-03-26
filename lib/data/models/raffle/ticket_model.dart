import 'package:profitei_flutter/domain/entities/raffle/ticket.dart';

class TicketModel extends Ticket {
  TicketModel({
    required super.id,
    required super.raffleId,
    required super.name,
    required super.status,
    required super.created,
    required super.modified,
    required super.winner,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      raffleId: json['raffleId'],
      name: json['name'],
      status: json['status'],
      created: DateTime.parse(json['created']),
      modified: DateTime.parse(json['modified']),
      winner: json['winner'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'raffle_id': raffleId,
      'name': name,
      'status': status,
      'created': created.toIso8601String(),
      'modified': modified.toIso8601String(),
      'winner': winner,
    };
  }

  factory TicketModel.fromEntity(Ticket ticket) {
    return TicketModel(
      id: ticket.id,
      raffleId: ticket.raffleId,
      name: ticket.name,
      status: ticket.status,
      created: ticket.created,
      modified: ticket.modified,
      winner: ticket.winner,
    );
  }
}
