import 'package:manager_app/models/product.dart';

import '../core/services/database_service.dart';

class ItemDetailRepository {
  ItemDetailRepository({ required this.db });

  final DatabaseService db;

  Future<Product?> getProductById(int productId) async {
    return db.fetchProductDetails(productId);
  }

}