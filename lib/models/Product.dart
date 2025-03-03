class Product {
  final int productId;
  final String productName;
  final String? description;
  final String? category;
  final int? totalQuantity;
  final String? image;

  Product({
    required this.productId,
    required this.productName,
    this.description,
    this.category,
    this.totalQuantity,
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

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'description': description,
      'category': category,
      'total_quantity': totalQuantity,
      'image': image,
    };
  }
}