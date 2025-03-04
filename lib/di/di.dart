import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:manager_app/core/services/database_service.dart';
import 'package:manager_app/core/services/storage_service.dart';
import 'package:manager_app/repositories/homeRepository.dart';
import 'package:manager_app/repositories/item_detail_repository.dart';
import 'package:supabase/supabase.dart';

import '../core/utils/constants.dart';

class DI {
  final getIt = GetIt.instance;

  void setupDependencies() {
    getIt.registerSingleton<SupabaseClient>(
      SupabaseClient(
        Constants.supabaseProjectUrl,
        Constants.supabaseApiKey,
      ),
    );

    getIt.registerSingleton<Logger>(Logger());

    getIt.registerSingleton<DatabaseService>(DatabaseService());
    getIt.registerSingleton<StorageService>(StorageService());

    getIt.registerSingleton<HomeRepository>(HomeRepository(db: getIt<DatabaseService>()));
    getIt.registerSingleton(ItemDetailRepository(db: getIt<DatabaseService>()));
  }
}