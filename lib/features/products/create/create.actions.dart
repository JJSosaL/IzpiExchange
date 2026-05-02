import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/core/rest/rest.response.dart';
import 'package:izpi_exchange/core/storage/storage.constants.dart';
import 'package:mime/mime.dart';

Future<RESTResponse> createProductRequest(
  BuildContext context, {
  required String description,
  required List<File> images,
  required String name,
  required String price,
}) async {
  final accessToken = await secureStorage.read(key: secureStorageAccessTokenKey);

  if (accessToken == null) {
    if (context.mounted) {
      context.go('/auth');
    }

    return RESTResponse(message: 'No Autorizado', success: false);
  }

  final requestUri = createRequestUri('api/products');
  final requestHeaders = {'authorization': accessToken};

  final request = MultipartRequest('POST', requestUri);

  request.headers.addAll(requestHeaders);

  request.fields['description'] = description;
  request.fields['name'] = name;
  request.fields['price'] = price;

  for (final image in images) {
    final mimeType = lookupMimeType(image.path);
    final mediaType = mimeType != null ? MediaType.parse(mimeType) : MediaType('application', 'octet-stream');

    request.files.add(await MultipartFile.fromPath('images', image.path, contentType: mediaType));
  }

  final response = await request.send();
  final responseStatus = response.statusCode;

  if (responseStatus == 201) {
    if (context.mounted) {
      context.push('/');
    }

    return RESTResponse(message: 'OK', success: true);
  } else {
    final responseObject = await Response.fromStream(response);
    final responseBody = jsonDecode(responseObject.body);
    final responseMessage = responseBody['message'];

    return RESTResponse(message: responseMessage, success: false);
  }
}
