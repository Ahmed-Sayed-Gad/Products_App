import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/product.dart';

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<List<Product>> fetchProducts() async {
    final response = await client.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      return jsonData.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
