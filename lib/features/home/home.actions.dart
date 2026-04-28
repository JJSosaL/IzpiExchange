import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/core/storage/storage.constants.dart';

Future<List<Product>> getPublishedProducts(BuildContext context) async {
  final accessToken = await secureStorage.read(key: secureStorageAccessTokenKey);

  if (accessToken == null) {
    if (context.mounted) {
      context.go('/auth');
    }

    return [];
  }

  final requestUri = createRequestUri('api/products');
  final requestHeaders = {'authorization': accessToken};

  final response = await get(requestUri, headers: requestHeaders);
  final responseStatus = response.statusCode;

  switch (responseStatus) {
    case 200:
      {
        final List responseBody = json.decode(response.body);
        final responseData = responseBody
            .map((productJson) => Product.fromJson(productJson))
            .toList();

        return responseData;
      }
    case 401:
      {
        throw Exception('El usuario no está autenticado');
      }
    default:
      {
        throw Exception('Ocurrió un error mientras se cargaban los productos');
      }
  }
}

class Product {
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      description: json['description'],
      id: json['id'],
      name: json['name'],
      price: (json['price']).toDouble(),
    );
  }

  Product({required this.description, required this.id, required this.name, required this.price});

  final String description;
  final String id;
  final String name;
  final double price;
}
