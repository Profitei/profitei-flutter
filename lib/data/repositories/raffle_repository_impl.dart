import 'package:dartz/dartz.dart';
import 'package:profitei_flutter/core/error/exceptions.dart';

import '../../../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/raffle/raffle.dart';
import '../../domain/entities/summary/summary.dart';
import '../../domain/repositories/raffle_repository.dart';
import '../data_sources/remote/raffle_remote_data_source.dart';

class RaffleRepositoryImpl implements RaffleRepository {
  final RaffleRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RaffleRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<RaffleSummary>>> getRaffleSummaries() async {
    if (await networkInfo.isConnected) {
      try {
        final summaries = await remoteDataSource.getRaffleSummaries();
        return Right(summaries);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override

Future<Either<Failure, List<Raffle>>> getRaffle(id) async {
    return Future.value(Left(NetworkFailure()));
  }

}
