import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/service_locator.dart';
import 'features/product/presentation/product_list_screen.dart';
import 'cubits/product_cubit/product_cubit.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductCubit>()..fetchProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product Grid',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        home: const ProductListScreen(),
      ),
    );
  }
}
