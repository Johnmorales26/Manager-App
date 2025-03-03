import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manager_app/providers/item_detail_provider.dart';
import '../../navigation/routes.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatelessWidget {
  ItemDetailScreen({super.key, required this.productId});

  late ItemDetailProvider provider;
  final String productId;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ItemDetailProvider>(context);
    provider.init();
    provider.getProductById(int.parse(productId));

    return Scaffold(
      appBar: AppBar(
        title: Text(productId),
        leading: IconButton(
          onPressed: () => context.go(Routes.routeHome),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder(
          future: provider.productReadOnly,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No hay productos disponibles'));
            } else {
              final product = snapshot.data!;
              return Text(product.productName);
            }
          }
      )
    );
  }
}
