import 'package:bkapp/widgets/product_card_grid.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import '../models/product_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isGrid = false;
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = ApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => isGrid = !isGrid),
          ),
        ],
      ),
      body: FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          return isGrid
              ? GridView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 10, mainAxisSpacing: 10, ),
                  itemBuilder: (context, index) =>
                      ProductCardGrid(product: data[index]),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      ProductCard(product: data[index]),
                );
        },
      ),
    );
  }
}
