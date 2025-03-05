import 'package:flutter/material.dart';
import 'package:manager_app/core/utils/theme.dart';
import 'package:manager_app/navigation/navigation.dart';

class ManagerApp extends StatelessWidget {
  final materialTheme = MaterialTheme(ThemeData.light().textTheme);

  ManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Manager App',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      routerConfig: Navigation().navigation(),
    );
  }
}