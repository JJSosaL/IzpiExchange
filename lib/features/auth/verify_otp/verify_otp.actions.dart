import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/core/rest/rest.response.dart';
import 'package:izpi_exchange/core/storage/storage.constants.dart';
import 'package:izpi_exchange/services/gateway.dart';

Future<RESTResponse> createVerifySignUpOtpRequest(
  String otpCode,
  String action,
  BuildContext context,
) async {
  final requestUri = createRequestUri('api/auth/verify-otp');

  final requestBody = jsonEncode({'action': action, 'otpCode': otpCode});
  final requestHeaders = {'content-type': 'application/json'};

  final response = await post(requestUri, body: requestBody, headers: requestHeaders);

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    final responseAccessToken = responseBody['accessToken'];

    await secureStorage.write(key: secureStorageAccessTokenKey, value: responseAccessToken);
    await GatewayService().reconnect();

    if (context.mounted) {
      context.go('/');
    }

    return RESTResponse(message: 'OK', success: true);
  } else {
    final responseBody = jsonDecode(response.body);
    final responseMessage = responseBody['message'];

    return RESTResponse(message: responseMessage, success: false);
  }
}
