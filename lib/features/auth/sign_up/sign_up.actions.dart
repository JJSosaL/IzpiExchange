import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';

Future<String?> createSignUpRequest(String email, BuildContext context) async {
  final requestUri = createRequestUri('api/auth/sign-up');
  final requestBody = {'email': email};

  final response = await post(
    requestUri,
    body: jsonEncode(requestBody),
    headers: {'content-type': 'application/json'},
  );

  if (response.statusCode == 201) {
    if (context.mounted) {
      context.push('/auth/verify-otp');
    }

    return null;
  } else {
    final responseBody = json.decode(response.body);
    final responseMessage = responseBody['message'];

    return responseMessage;
  }
}
