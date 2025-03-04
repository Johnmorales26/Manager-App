import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:manager_app/core/services/database_service.dart';
import 'package:manager_app/core/services/storage_service.dart';

import '../models/product.dart';

class AddProductProvider extends ChangeNotifier {

  final Logger logger = GetIt.instance<Logger>();
  final DatabaseService db = GetIt.instance<DatabaseService>();
  final StorageService storage = GetIt.instance<StorageService>();

  Future<void> addProduct(Product product) async {
    try {
      if (product.image != null) {
        final url = await storage.uploadImageToSupabase(product.image!);

        if (url != null) {
          final finalProduct = product.copyWith(image: url);
          await db.addProduct(finalProduct);
        } else {
          await db.addProduct(product);
        }
      } else {
        await db.addProduct(product);
      }
    } catch (e) {
      logger.e('Error al agregar el producto: $e');
    }
  }
}