import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/raffle/raffle.dart';
import '../entities/summary/summary.dart';

abstract class RaffleRepository {
  Future<Either<Failure, List<RaffleSummary>>> getRaffleSummaries();
  Future<Either<Failure, List<Raffle>>> getRaffle(id);
}
