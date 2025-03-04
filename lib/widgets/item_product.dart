import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:manager_app/core/theme/assets.dart';
import 'package:manager_app/models/product.dart';
import 'package:manager_app/navigation/routes.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  final VoidCallback delete;

  const ItemProduct({super.key, required this.product, required this.delete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('¿Estás seguro de eliminar este ítem?'),
              content: Text(
                'Si eliminas este ítem, se borrará permanentemente de la base de datos.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    delete();
                    Navigator.pop(context);
                  },
                  child: Text('Eliminar'),
                ),
              ],
            );
          },
        );
      },
      onTap: () {
        context.go('${Routes.routeItemDetail}/${product.productId}');
      },
      child: ListTile(
        leading:
            (product.image != null &&
                    product.image!.toLowerCase() != 'null' &&
                    product.image!.trim().isNotEmpty)
                ? Image.network(
                  product.image!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
                : SvgPicture.asset(
                  Assets.icImageDownload,
                  width: 50,
                  height: 50,
                ),
        title: Text(
          product.productName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.description != null && product.description!.isNotEmpty)
              Text(
                product.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            if (product.category != null)
              Text(
                "Categoría: ${product.category}",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
          ],
        ),
        trailing:
            product.totalQuantity != null
                ? Chip(
                  label: Text("${product.totalQuantity} en stock"),
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                )
                : null,
      ),
    );
  }
}
