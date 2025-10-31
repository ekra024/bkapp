class Product {
  final String title;
  final String description;
  final String thumbnail;
  final double rating;
  final int stock;
  final double price;

  Product({
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.rating,
    required this.stock,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] ?? 'No Name',
      description: json['description'] ?? 'No Description',
      thumbnail: json['thumbnail'] ?? "https://placehold.co/200",
      rating: (json['rating'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
