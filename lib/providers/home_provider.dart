import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../core/utils/constants.dart';
import '../models/product.dart';
import '../repositories/repositories.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository repository = GetIt.instance<HomeRepository>();

  List<Product> _products = [];
  List<Product> get productsReadOnly => _products;

  void init() {
    fetchAllProducts(Constants.tableProducts);
  }

  void fetchAllProducts(String tableProducts) async {
    _products = await repository.fetchAllProducts(tableProducts);
    notifyListeners();
  }

  void deleteProduct(int productId) {
    repository.deleteProduct(productId);
    
  }

}