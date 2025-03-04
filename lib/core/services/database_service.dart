import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:supabase/supabase.dart';

import '../../models/product.dart';
import '../utils/constants.dart';

class DatabaseService {
  late SupabaseClient supabase;
  final Logger logger = GetIt.instance<Logger>();

  void init() async {
    supabase = SupabaseClient(
      Constants.supabaseProjectUrl,
      Constants.supabaseApiKey,
    );
  }

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

  Future<void> fetchProductDetails(int productId) async {
    Logger logger = Logger();
    final response = await supabase
      .from('products')
      .select('''
        product_id,
        product_name,
        description,
        category,
        total_quantity,
        image,
        inventory(quantity, location_id, locations(location_name, description, buildings(building_name, address))),
        movements(movement_id, movement_type, quantity, movement_date, users(user_name, role))
      ''')
      .eq('product_id', productId);

      if (response.isEmpty) {
        logger.e('No se encontraron datos para el producto con ID $productId');
      return;
      }

      logger.d(response.toString());
  }
}
