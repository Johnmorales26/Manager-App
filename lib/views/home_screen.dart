import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:manager_app/providers/home_provider.dart';
import '../../navigation/routes.dart';
import 'package:manager_app/core/theme/assets.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future: provider.productsReadOnly,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos disponibles'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return InkWell(
                  onTap: () {
                    context.go('${Routes.routeItemDetail}/${product.productId}');
                  },
                  child: ListTile(
                    leading: (product.image?.toLowerCase() != 'null' && product.image!.trim().isNotEmpty)
                        ? Image.network(product.image!, width: 50, height: 50, fit: BoxFit.cover)
                        : SvgPicture.asset(Assets.icImageDownload, width: 50, height: 50),
                    title: Text(product.productName, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (product.description != null && product.description!.isNotEmpty)
                          Text(product.description!, maxLines: 2, overflow: TextOverflow.ellipsis),
                        if (product.category != null)
                          Text("Categoría: ${product.category}", style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    trailing: product.totalQuantity != null
                        ? Chip(
                        label: Text("${product.totalQuantity} en stock"),
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer
                    )
                        : null,
                  )
                );
              },
            );
          }
        },
      ),
    );
  }
}
