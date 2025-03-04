class Inventory {
  final int inventoryId;
  final int productId;
  final int locationId;
  final int quantity;

  Inventory({
    required this.inventoryId,
    required this.productId,
    required this.locationId,
    required this.quantity,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      inventoryId: json['inventory_id'],
      productId: json['product_id'],
      locationId: json['location_id'],
      quantity: json['quantity'],
    );
  }
}