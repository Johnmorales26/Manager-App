import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manager_app/models/product.dart';
import 'package:manager_app/navigation/routes.dart';
import 'package:manager_app/providers/add_product_provider.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final _productNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _totalQuantityController = TextEditingController();
  final _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddProductProvider>(context);

    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _imageController.text = pickedFile.path;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
        leading: IconButton(
          onPressed: () {
            context.go(Routes.routeHome);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Nombre del Producto'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Categoría'),
            ),
            TextField(
              controller: _totalQuantityController,
              decoration: InputDecoration(labelText: 'Cantidad Total'),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _imageController,
                    decoration: InputDecoration(labelText: 'URL de la Imagen'),
                    readOnly: true,
                  ),
                ),
                IconButton(onPressed: () {
                  pickImage();
                }, icon: Icon(Icons.image)),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  productId: 0,
                  productName: _productNameController.text,
                  description: _descriptionController.text,
                  category: _categoryController.text,
                  totalQuantity: int.parse(
                    _totalQuantityController.text.trim(),
                  ),
                  image: _imageController.text
                );
                provider.addProduct(product);
              },
              child: Text('Agregar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
