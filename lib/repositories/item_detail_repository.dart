import '../core/services/database_service.dart';

class ItemDetailRepository {
  ItemDetailRepository({ required this.db });

  final DatabaseService db;

  void init() {
    db.init();
  }

  Future<void> getProductById(int productId) async {
    db.fetchProductDetails(productId);
  }

}