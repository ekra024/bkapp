import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        children: [
          // IMAGE SECTION
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(product.thumbnail, fit: BoxFit.cover),
          ),

          // MIDDLE CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text("Rating: ${product.rating}  |  Stock: ${product.stock}"),
                ],
              ),
            ),
          ),

          // PRICE + CART BUTTON
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text("\$${product.price}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
