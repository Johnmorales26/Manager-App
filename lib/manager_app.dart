import 'package:flutter/material.dart';
import 'package:manager_app/navigation/navigation.dart';

class ManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Manager App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      routerConfig: Navigation().navigation(),
    );
  }
}