import 'package:dartz/dartz.dart';
import 'package:profitei_flutter/domain/entities/category/category.dart';

import '../../../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/remote/category_remote_data_source.dart';


class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Category>>> getRemoteCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getCategories();
        return Right(remoteProducts);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }

   @override
  Future<Either<Failure, List<Category>>> filterRemoteCategories(params) async {
    try {
      final cachedCategories = await remoteDataSource.getCategories();
      final categories = cachedCategories;
      final filteredCategories = categories
          .where((element) =>
              element.name.toLowerCase().contains(params.toLowerCase()))
          .toList();
      return Right(filteredCategories);
    } on Failure {
      return Left(CacheFailure());
    }
  }
}
