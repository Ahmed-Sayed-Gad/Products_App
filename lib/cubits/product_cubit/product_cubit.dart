import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product.dart';
import '../../repositories/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await repository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
