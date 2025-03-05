import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:supabase/supabase.dart';

import '../../models/product.dart';
import '../utils/constants.dart';

class DatabaseService {
  final SupabaseClient supabase = GetIt.instance<SupabaseClient>();
  final Logger logger = GetIt.instance<Logger>();

  Future<PostgrestList?> _readTable(String table) async {
    try {
      return await supabase.from(table).select();
    } catch (e) {
      return null;
    }
  }

  Future<List<Product>> fetchAllProducts(String table) async {
    PostgrestList? response = await _readTable(table);
    if (response != null) {
      final data = response as List<dynamic>;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<Product?> getProductById(int productId) async {
    final response =
        await supabase
            .from(Constants.tableProducts)
            .select()
            .eq(Constants.columnProductId, productId)
            .maybeSingle();

    if (response == null) return null;

    return Product.fromJson(response);
  }

  Future<void> deleteProduct(int productId) async {
    await supabase
        .from(Constants.tableInventory)
        .delete()
        .eq(Constants.columnProductId, productId);

    await supabase
        .from(Constants.tableProducts)
        .delete()
        .eq(Constants.columnProductId, productId);

    Future.delayed(Duration(milliseconds: 2000));
  }

  Future<Product?> fetchProductDetails(int productId) async {
    final response =
        await supabase
            .from('products')
            .select()
            .eq('product_id', productId)
            .single();

    if (response.isEmpty) {
      return null;
    }

    return Product.fromJson(response);
  }

  Future<void> addProduct(Product product) async {
    try {
      await supabase.from(Constants.tableProducts).insert([product.toJson()]);
      logger.d('Producto agregado exitosamente');
    } catch (e) {
      logger.e('Error al agregar producto: $e');
    }
  }
}
