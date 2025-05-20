import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/product_cubit/product_cubit.dart';
import 'product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else if (state is ProductLoaded) {
            final products = state.products;

            return GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,),
              itemBuilder:
                  (context, index) => ProductCard(product: products[index]),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
