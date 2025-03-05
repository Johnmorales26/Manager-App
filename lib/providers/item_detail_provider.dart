import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/product.dart';
import '../repositories/repositories.dart';

class ItemDetailProvider extends ChangeNotifier {
  final ItemDetailRepository repository =
      GetIt.instance<ItemDetailRepository>();

  Future<Product?> getProductById(int productId) async {
    return await repository.getProductById(productId);
  }
}
