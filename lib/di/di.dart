import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:manager_app/core/services/database_service.dart';
import 'package:manager_app/repositories/homeRepository.dart';
import 'package:manager_app/repositories/item_detail_repository.dart';

class DI {
  final getIt = GetIt.instance;

  void setupDependencies() {
    getIt.registerSingleton<Logger>(Logger());

    getIt.registerSingleton<DatabaseService>(DatabaseService());

    getIt.registerSingleton<HomeRepository>(HomeRepository(db: getIt<DatabaseService>()));
    getIt.registerSingleton(ItemDetailRepository(db: getIt<DatabaseService>()));
  }
}