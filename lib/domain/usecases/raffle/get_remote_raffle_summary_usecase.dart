import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/summary/summary.dart';
import '../../repositories/raffle_repository.dart';

class GetRemoteRaffleSummaryUseCase implements UseCase<List<RaffleSummary>, NoParams> {
  final RaffleRepository repository;
  GetRemoteRaffleSummaryUseCase(this.repository);

  @override
  Future<Either<Failure, List<RaffleSummary>>> call(NoParams params) async {
    return await repository.getRaffleSummaries();
  }
}
