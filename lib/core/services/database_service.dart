import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:supabase/supabase.dart';

import '../../models/Product.dart';
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
      return await supabase
          .from(table)
          .select();
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
    final response = await supabase
        .from(Constants.tableProducts)
        .select()
        .eq(Constants.columnProductId, productId)
        .maybeSingle();

    if (response == null) return null;

    return Product.fromJson(response);
  }

}
