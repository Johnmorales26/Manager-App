import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../core/utils/constants.dart';
import '../models/Product.dart';
import '../repositories/repositories.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository repository = GetIt.instance<HomeRepository>();

  Future<List<Product>> _products = Future.value([]);
  Future<List<Product>> get productsReadOnly => _products;

  void init() {
    repository.init();
    fetchAllProducts(Constants.tableProducts);
  }

  void fetchAllProducts(String tableProducts) {
    _products = repository.fetchAllProducts(tableProducts);
    notifyListeners();
  }

}