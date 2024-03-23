class Ticket {
  final int id;
  final String name;
  final bool winner;
  final String status;
  final int raffleId;
  final int? userId;
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