import '../core/services/database_service.dart';
import '../models/Product.dart';

class ItemDetailRepository {
  ItemDetailRepository({ required this.db });

  final DatabaseService db;

  void init() {
    db.init();
  }

  Future<Product?> getProductById(int productId) async {
    return db.getProductById(productId);
  }

}