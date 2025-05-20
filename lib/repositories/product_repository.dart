import '../models/product.dart';
import '../services/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  Future<List<Product>> getProducts() {
    return apiService.fetchProducts();
  }
}
