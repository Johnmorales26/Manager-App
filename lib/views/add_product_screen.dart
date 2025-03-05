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

  // Estilo personalizado para los TextField
  final InputDecoration customInputDecoration = InputDecoration(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(),
  );

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
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'Agregar Producto',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        leading: IconButton(
          onPressed: () {
            context.go(Routes.routeHome);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: _productNameController,
                        decoration: customInputDecoration.copyWith(
                          labelText: 'Nombre del Producto',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _descriptionController,
                        decoration: customInputDecoration.copyWith(
                          labelText: 'Descripción',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _categoryController,
                        decoration: customInputDecoration.copyWith(
                          labelText: 'Categoría',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _totalQuantityController,
                        decoration: customInputDecoration.copyWith(
                          labelText: 'Cantidad Total',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _imageController,
                              decoration: customInputDecoration.copyWith(
                                labelText: 'URL de la Imagen',
                              ),
                              readOnly: true,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: Icon(Icons.image),
                          ),
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
                            image: _imageController.text,
                          );
                          provider.addProduct(product);
                        },
                        child: Text('Agregar Producto'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}