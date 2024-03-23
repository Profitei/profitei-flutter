import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:profitei_flutter/data/data_sources/remote/raffle_remote_data_source.dart';
import 'package:profitei_flutter/data/repositories/raffle_repository_impl.dart';
import 'package:profitei_flutter/domain/repositories/raffle_repository.dart';
import 'package:profitei_flutter/domain/usecases/raffle/get_remote_raffle_summary_usecase.dart';
import 'package:profitei_flutter/domain/usecases/raffle/get_remote_raffle_usecase.dart';
import 'package:profitei_flutter/presentation/blocs/summary/summary_fetch_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_sources/local/cart_local_data_source.dart';
import '../../data/data_sources/local/user_local_data_source.dart';
import '../../data/data_sources/remote/cart_remote_data_source.dart';
import '../../data/data_sources/remote/category_remote_data_source.dart';
import '../../data/data_sources/remote/order_remote_data_source.dart';
import '../../data/data_sources/remote/product_remote_data_source.dart';
import '../../data/data_sources/remote/user_remote_data_source.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../data/repositories/order_repository_impl.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/cart/add_cart_item_usecase.dart';
import '../../domain/usecases/cart/clear_cart_usecase.dart';
import '../../domain/usecases/cart/get_cached_cart_usecase.dart';
import '../../domain/usecases/cart/sync_cart_usecase.dart';
import '../../domain/usecases/category/filter_category_usecase.dart';
import '../../domain/usecases/category/get_remote_category_usecase.dart';
import '../../domain/usecases/order/add_order_usecase.dart';
import '../../domain/usecases/order/get_remote_orders_usecase.dart';
import '../../domain/usecases/product/get_product_usecase.dart';
import '../../domain/usecases/user/get_cached_user_usecase.dart';
import '../../domain/usecases/user/sign_in_usecase.dart';
import '../../domain/usecases/user/sign_out_usecase.dart';
import '../../domain/usecases/user/sign_up_usecase.dart';
import '../../presentation/blocs/cart/cart_bloc.dart';
import '../../presentation/blocs/category/category_bloc.dart';
import '../../presentation/blocs/order/order_add/order_add_cubit.dart';
import '../../presentation/blocs/order/order_fetch/order_fetch_cubit.dart';
import '../../presentation/blocs/product/product_bloc.dart';
import '../../presentation/blocs/user/user_bloc.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features - Product
  // Bloc
  sl.registerFactory(
    () => ProductBloc(sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetProductUseCase(sl()));
  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: sl()),
  );

  //Features - Category
  // Bloc
  sl.registerFactory(
    () => CategoryBloc(sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetRemoteCategoryUseCase(sl()));
  sl.registerLazySingleton(() => FilterCategoryUseCase(sl()));
  // Repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(client: sl()),
  );

  //Features - Cart
  // Bloc
  sl.registerFactory(
    () => CartBloc(sl(), sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCachedCartUseCase(sl()));
  sl.registerLazySingleton(() => AddCartUseCase(sl()));
  sl.registerLazySingleton(() => SyncCartUseCase(sl()));
  sl.registerLazySingleton(() => ClearCartUseCase(sl()));
  // Repository
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      userLocalDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //Features - Order
  // Bloc
  sl.registerFactory(
    () => OrderAddCubit(sl()),
  );
  sl.registerFactory(
    () => OrderFetchCubit(sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => AddOrderUseCase(sl()));
  sl.registerLazySingleton(() => GetRemoteOrdersUseCase(sl()));
  // Repository
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
      userLocalDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceSourceImpl(client: sl()),
  );
  
  //Features - User
  // Bloc
  sl.registerFactory(
    () => UserBloc(sl(), sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );

  //Features - Raffle Summaries
  // Bloc
  sl.registerFactory(
    () => RaffleSummaryFetchCubit(sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetRemoteRaffleSummaryUseCase(sl()));
  sl.registerLazySingleton(() => GetRemoteRaffleUseCase(sl()));
  // Repository
  sl.registerLazySingleton<RaffleRepository>(
    () => RaffleRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<RaffleRemoteDataSource>(
    () => RaffleRemoteDataSourceSourceImpl(client: sl()),
  );

  ///***********************************************
  ///! Core
  /// sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///! External
  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
