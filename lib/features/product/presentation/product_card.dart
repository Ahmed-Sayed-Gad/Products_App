import 'package:flutter/material.dart';
import '../../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(product.image, height: 100, fit: BoxFit.contain),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Icon(Icons.favorite_border, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(product.description, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('EGP ${product.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('2000 EGP', style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 12, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('Review (${product.rating})', style: const TextStyle(fontSize: 12)),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 12,
                  child: const Icon(Icons.add, size: 16, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
