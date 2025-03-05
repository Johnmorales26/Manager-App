import 'package:flutter/material.dart';
import 'package:manager_app/models/product.dart';
import 'product_image.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ProductImage(imageUrl: product.image),
          const Divider(),
          _buildDetailRow(context, 'Nombre:', product.productName),
          const Divider(),
          _buildDetailRow(context, 'ID:', product.productId.toString()),
          const Divider(),
          _buildDetailRow(context, 'Categoría:', product.category),
          const Divider(),
          _buildDetailRow(context, 'Descripción:', product.description),
          const Divider(),
          _buildDetailRow(
            context,
            'Cantidad Total:',
            product.totalQuantity.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
