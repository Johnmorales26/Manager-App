import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manager_app/models/product.dart';
import 'package:manager_app/providers/item_detail_provider.dart';
import 'package:manager_app/widgets/product_details.dart';
import 'package:toastification/toastification.dart';
import '../../navigation/routes.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'Producto',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          )
        ),
        leading: IconButton(
          onPressed: () => context.go(Routes.routeHome),
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
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
        child: Consumer<ItemDetailProvider>(
          builder: (context, provider, child) {
            return FutureBuilder<Product?>(
              future: provider.getProductById(int.parse(productId)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError || snapshot.data == null) {
                  toastification.show(
                    context: context,
                    title: Text(
                      snapshot.hasError
                          ? 'Error: ${snapshot.error}'
                          : 'Producto no encontrado',
                    ),
                    style: ToastificationStyle.minimal,
                  );
                  context.go(Routes.routeHome);
                  return const Center(
                    child: Text('Error al cargar el producto'),
                  );
                }
                return ProductDetails(product: snapshot.data!);
              },
            );
          },
        ),
      ),
    );
  }
}
