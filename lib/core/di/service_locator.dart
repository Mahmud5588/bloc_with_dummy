import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feauteres/product/data/data_sources/product_remote_datasource.dart';
import '../../feauteres/product/data/repositories/product_repository_imp.dart';
import '../../feauteres/product/domain/repositories/product_repository.dart';
import '../../feauteres/product/domain/use_cases/all_product_usecase.dart';
import '../../feauteres/product/domain/use_cases/product_usecase.dart';
import '../../feauteres/product/domain/use_cases/search_product_usecase.dart';
import '../../feauteres/product/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> setUp() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ProductUseCase>(() => ProductUseCase(sl()));
  sl.registerLazySingleton<GetAllProductsUseCase>(
    () => GetAllProductsUseCase(sl()),
  );
  sl.registerLazySingleton<SearchProductsUseCase>(
    () => SearchProductsUseCase(sl()),
  );
  sl.registerFactory<ProductBloc>(
    () => ProductBloc(
      productUseCase: sl(),
      getAllProductsUseCase: sl(),
      searchProductsUseCase: sl(), // Add this parameter
    ),
  );
}
