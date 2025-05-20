import '../../../models/product.dart';
import 'api_service.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  final ApiService apiService;

  ProductRepositoryImpl(this.apiService);

  @override
  Future<List<Product>> getAllProducts() {
    return apiService.fetchProducts();
  }
}
