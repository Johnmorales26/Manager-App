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
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'Manager App',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go(Routes.routeScanner),
            icon: Icon(
              Icons.qr_code,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Consumer<HomeProvider>(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(Routes.routeAddProduct);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
