import 'package:get_it/get_it.dart';
import '../services/api_service.dart';
import '../repositories/product_repository.dart';
import '../cubits/product_cubit/product_cubit.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => ApiService());
  
  sl.registerLazySingleton(() => ProductRepository(sl()));
  
  sl.registerFactory(() => ProductCubit(sl()));
}
