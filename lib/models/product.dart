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

  Product copyWith({
    int? productId,
    String? productName,
    String? description,
    String? category,
    int? totalQuantity,
    String? image,
  }) {
    return Product(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      category: category ?? this.category,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      image: image ?? this.image,
    );
  }

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