class Movement {
  final int movementId;
  final int productId;
  final int locationId;
  final String movementType;
  final int quantity;
  final DateTime movementDate;
  final int userId;

  Movement({
    required this.movementId,
    required this.productId,
    required this.locationId,
    required this.movementType,
    required this.quantity,
    required this.movementDate,
    required this.userId,
  });

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
      movementId: json['movement_id'],
      productId: json['product_id'],
      locationId: json['location_id'],
      movementType: json['movement_type'],
      quantity: json['quantity'],
      movementDate: DateTime.parse(json['movement_date']),
      userId: json['user_id'],
    );
  }
}