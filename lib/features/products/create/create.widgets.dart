import 'dart:io';
import 'package:flutter/material.dart';
import 'package:izpi_exchange/shared/widgets/buttons/filled_button.dart';
import 'package:izpi_exchange/shared/widgets/buttons/outline_button.dart';
import 'package:izpi_exchange/shared/widgets/forms/text_input.dart';
import 'package:izpi_exchange/shared/widgets/layout/alert.dart';

class CreateProductAlert extends StatelessWidget {
  const CreateProductAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedAlert(
      content: 'Tu producto estará pendiente de verificación por un gestor antes de ser público',
      variant: AlertVariant.warning,
    );
  }
}

class CreateProductImageGallery extends StatelessWidget {
  const CreateProductImageGallery({super.key, required this.images, required this.onTap});

  final List<File> images;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return SharedAlert(content: 'Las imágenes que subas aparecerán aquí', variant: AlertVariant.info);
    }

    return GridView.builder(
      itemBuilder: (context, index) {
        return CreateProductImageGalleryItem(image: images[index], index: index, onTap: onTap);
      },
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}

class CreateProductImageGalleryItem extends StatelessWidget {
  const CreateProductImageGalleryItem({super.key, required this.image, required this.index, required this.onTap});

  final File image;
  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getImageWidget(), _getRemoveButtonWidget()]);
  }

  Widget _getImageWidget() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.file(image, fit: BoxFit.cover),
      ),
    );
  }

  Widget _getRemoveButtonWidget() {
    return Positioned(
      right: 5,
      top: 5,
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.5), color: Colors.black45),
          child: const Icon(Icons.close, color: Colors.white, size: 25),
        ),
      ),
    );
  }
}

class CreateProductAddImagesButton extends StatelessWidget {
  const CreateProductAddImagesButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SharedOutlinedButton(content: 'Añadir Imágenes', onPressed: onPressed),
    );
  }
}

class CreateProductNameInput extends StatelessWidget {
  const CreateProductNameInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SharedTextInput(controller: controller, keyboardType: TextInputType.text, label: 'Nombre');
  }
}

class CreateProductDescriptionInput extends StatelessWidget {
  const CreateProductDescriptionInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SharedTextInput(controller: controller, keyboardType: TextInputType.multiline, label: 'Descripción');
  }
}

class CreateProductPriceInput extends StatelessWidget {
  const CreateProductPriceInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SharedTextInput(controller: controller, keyboardType: TextInputType.number, label: 'Precio');
  }
}

class CreateProductCreateButton extends StatelessWidget {
  const CreateProductCreateButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SharedFilledButton(content: 'Crear Producto', onPressed: onPressed),
    );
  }
}
