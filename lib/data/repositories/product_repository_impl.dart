import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/product/product_response.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/product/get_product_usecase.dart';
import '../data_sources/remote/product_remote_data_source.dart';

typedef _ConcreteOrProductChooser = Future<ProductResponse> Function();

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductResponse>> getProducts(
      FilterProductParams params) async {
    return await _getProduct(() {
      return remoteDataSource.getProducts(params);
    });
  }

  Future<Either<Failure, ProductResponse>> _getProduct(
    _ConcreteOrProductChooser getConcreteOrProducts,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await getConcreteOrProducts();
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
