import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/core/rest/rest.response.dart';

Future<RESTResponse> createSignUpRequest(String email, BuildContext context) async {
  final requestUri = createRequestUri('api/auth/sign-up');

  final requestBody = jsonEncode({'email': email});
  final requestHeaders = {'content-type': 'application/json'};

  final response = await post(requestUri, body: requestBody, headers: requestHeaders);

  if (response.statusCode == 202) {
    if (context.mounted) {
      context.push('/auth/verify_otp/sign_up');
    }

    return RESTResponse(message: 'OK', success: true);
  } else {
    final responseBody = jsonDecode(response.body);
    final responseMessage = responseBody['message'];

    return RESTResponse(message: responseMessage, success: false);
  }
}
