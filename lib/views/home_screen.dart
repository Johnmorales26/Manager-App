import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manager_app/providers/home_provider.dart';
import 'package:manager_app/widgets/item_product.dart';
import '../../navigation/routes.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  late HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);
    provider.init();

    return Scaffold(
      appBar: AppBar(
        title: Text('Manager App'),
        actions: [
          IconButton(
            onPressed: () => context.go(Routes.routeScanner),
            icon: Icon(Icons.qr_code),
          ),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return ListView.builder(
            itemCount: homeProvider.productsReadOnly.length,
            itemBuilder: (context, index) {
              final product = homeProvider.productsReadOnly[index];
              return ItemProduct(
                product: product,
                delete: () {
                  provider.deleteProduct(product.productId);
                },
              );
            },
          );
        },
      ),
    );
  }
}
