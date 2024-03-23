import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/raffle/raffle.dart';
import '../../repositories/raffle_repository.dart';

class GetRemoteRaffleUseCase implements UseCase<Raffle, num> {
  final RaffleRepository repository;
  GetRemoteRaffleUseCase(this.repository);

  @override
  Future<Either<Failure, Raffle>> call(num id) async {
    return await repository.getRaffle(id);
  }
}
