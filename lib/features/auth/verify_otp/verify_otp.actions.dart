import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:izpi_exchange/core/auth/auth.constants.dart';
import 'package:izpi_exchange/core/auth/auth.storage.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/core/rest/rest.response.dart';

Future<RESTResponse> createVerifySignUpOtpRequest(
  String otpCode,
  String action,
  BuildContext context,
) async {
  final requestUri = createRequestUri('api/auth/verify-otp');
  final requestBody = {'action': action, 'otp': otpCode};

  final response = await post(
    requestUri,
    body: jsonEncode(requestBody),
    headers: {'content-type': 'application/json'},
  );

  if (response.statusCode == 201) {
    final responseBody = json.decode(response.body);
    final responseAccessToken = responseBody['accessToken'];

    // Guardar el token de acceso en la aplicación.
    await flutterSecureStorage.write(key: accessTokenKey, value: responseAccessToken);

    if (context.mounted) {
      // Utilizar 'go' para eliminar el historial de navegación.
      context.go('/');
    }

    return RESTResponse(message: 'OK', success: true);
  } else {
    final responseBody = json.decode(response.body);
    final responseMessage = responseBody['message'];

    return RESTResponse(message: responseMessage, success: false);
  }
}
