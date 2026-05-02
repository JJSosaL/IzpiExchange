import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:izpi_exchange/features/products/create/create.actions.dart';
import 'package:izpi_exchange/features/products/create/create.widgets.dart';
import 'package:izpi_exchange/shared/layouts/main.layout.dart';
import 'package:izpi_exchange/shared/widgets/overlay/snack_bar.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  final _descriptionController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  bool _isLoading = false;
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            _getAlertWidget(),
            _getImageGalleryWidget(),
            _getAddImagesButtonWidget(),
            _getNameInputWidget(),
            _getDescriptionWidget(),
            _getPriceInputWidget(),
            _getCreateButtonWidget(),
          ],
        ),
      ),
      title: 'Crear Producto',
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _nameController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  SnackBar _buildSnackBar(String errorMessage) {
    return SharedSnackBar.build(errorMessage, variant: SnackBarVariant.error);
  }

  Widget _getAddImagesButtonWidget() {
    return CreateProductAddImagesButton(onPressed: _isUploading ? null : _pickImages);
  }

  Widget _getAlertWidget() {
    return const CreateProductAlert();
  }

  Widget _getCreateButtonWidget() {
    return CreateProductCreateButton(onPressed: _isLoading ? null : _submitData);
  }

  Widget _getDescriptionWidget() {
    return CreateProductDescriptionInput(controller: _descriptionController);
  }

  Widget _getImageGalleryWidget() {
    return CreateProductImageGallery(images: _images, onTap: _removeImage);
  }

  Widget _getNameInputWidget() {
    return CreateProductNameInput(controller: _nameController);
  }

  Widget _getPriceInputWidget() {
    return CreateProductPriceInput(controller: _priceController);
  }

  Future<void> _pickImages() async {
    setState(() {
      _isUploading = true;
    });

    final List<XFile> picked = await _picker.pickMultiImage(imageQuality: 80, limit: 5, requestFullMetadata: false);

    if (picked.isNotEmpty) {
      setState(() {
        _images.addAll(picked.map((xFile) => File(xFile.path)));
      });
    }

    setState(() {
      _isUploading = false;
    });
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  Future<void> _submitData() async {
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final description = _descriptionController.text.trim();
      final name = _nameController.text.trim();
      final price = _priceController.text.trim();

      final response = await createProductRequest(context, description: description, images: _images, name: name, price: price);

      if (!response.success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(response.message));
        }
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
