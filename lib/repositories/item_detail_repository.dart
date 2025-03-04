import '../core/services/database_service.dart';

class ItemDetailRepository {
  ItemDetailRepository({ required this.db });

  final DatabaseService db;

  Future<void> getProductById(int productId) async {
    db.fetchProductDetails(productId);
  }

}