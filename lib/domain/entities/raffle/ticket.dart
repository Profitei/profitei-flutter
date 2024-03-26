class Ticket {
  final num id;
  final String name;
  final bool winner;
  final String status;
  final num raffleId;
  final num? userId;
  final DateTime created;
  final DateTime modified;

  Ticket({
    required this.id,
    required this.name,
    required this.winner,
    required this.status,
    required this.raffleId,
    this.userId,
    required this.created,
    required this.modified,
  });
}
