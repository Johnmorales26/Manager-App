class Product {
  final int productId;
  final String productName;
  final String description;
  final String category;
  final int totalQuantity;
  final String? image;

  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.category,
    required this.totalQuantity,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productName: json['product_name'],
      description: json['description'],
      category: json['category'],
      totalQuantity: json['total_quantity'],
      image: json['image'],
    );
  }
}