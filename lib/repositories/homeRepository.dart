import 'package:manager_app/core/services/database_service.dart';

import '../models/product.dart';

class HomeRepository {
  HomeRepository({ required this.db });

  final DatabaseService db;

  Future<List<Product>> fetchAllProducts(String tableProducts) {
    return db.fetchAllProducts(tableProducts);
  }

  void deleteProduct(int productId) {
    db.deleteProduct(productId);
  }

}