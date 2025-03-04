import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:supabase/supabase.dart';

class StorageService {

  final Logger logger = GetIt.instance<Logger>();
  final SupabaseClient supabase = GetIt.instance<SupabaseClient>();

  Future<String?> uploadImageToSupabase(String filePath) async {
    final file = File(filePath);
    final fileName = 'product_${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      await supabase.storage.from('product-images').upload(fileName, file,
          fileOptions: const FileOptions(contentType: 'image/jpeg'));

      final imageUrl = supabase.storage.from('product-images').getPublicUrl(fileName);

      return imageUrl;
    } catch (e) {
      logger.e('Error al subir la imagen: $e');
      return null;
    }
  }
}