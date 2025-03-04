import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/product.dart';
import '../repositories/repositories.dart';

class ItemDetailProvider extends ChangeNotifier {
  final ItemDetailRepository repository = GetIt.instance<ItemDetailRepository>();

  final Future<Product?> _product = Future.value(null);
  Future<Product?> get productReadOnly => _product;

  void getProductById(int productId) async {
    repository.getProductById(productId);
    notifyListeners();
  }

}