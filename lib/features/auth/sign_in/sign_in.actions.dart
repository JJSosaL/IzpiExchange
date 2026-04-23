import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/core/rest/rest.response.dart';

Future<RESTResponse> createSignInRequest(String email, BuildContext context) async {
  final requestUri = createRequestUri('api/auth/sign-in');
  final requestBody = {'email': email};

  final response = await post(
    requestUri,
    body: jsonEncode(requestBody),
    headers: {'content-type': 'application/json'},
  );

  if (response.statusCode == 202) {
    if (context.mounted) {
      // Utilizar 'push' para utilizar el historial de navegación.
      context.push('/auth/verify_otp/sign_in');
    }

    return RESTResponse(message: 'OK', success: true);
  } else {
    final responseBody = json.decode(response.body);
    final responseMessage = responseBody['message'];

    return RESTResponse(message: responseMessage, success: false);
  }
}
