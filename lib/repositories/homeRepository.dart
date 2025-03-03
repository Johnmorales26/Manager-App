import 'package:manager_app/core/services/database_service.dart';

import '../models/Product.dart';

class HomeRepository {
  HomeRepository({ required this.db });

  final DatabaseService db;

  void init() {
    db.init();
  }

  Future<List<Product>> fetchAllProducts(String tableProducts) {
    return db.fetchAllProducts(tableProducts);
  }

}