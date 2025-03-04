import 'package:flutter/material.dart';
import 'package:manager_app/di/di.dart';
import 'package:manager_app/providers/add_product_provider.dart';
import '../manager_app.dart';
import 'package:manager_app/providers/home_provider.dart';
import 'package:manager_app/providers/item_detail_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DI().setupDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ItemDetailProvider()),
        ChangeNotifierProvider(create: (context) => AddProductProvider())
      ],
      child: ManagerApp(),
    ),
  );
}
