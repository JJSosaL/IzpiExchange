import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:izpi_exchange/core/rest/rest.constants.dart';
import 'package:izpi_exchange/core/rest/rest.response.dart';

/*
  Envía una petición a la API para crear una cuenta nueva en la aplicación.

  Esta función puede devolver 'null' o un objeto conteniendo los datos del
  error devuelto desde la API.

  Este objeto se utilizará para mostrar un mensaje inferior con la
  información del error.
*/
Future<RESTResponse> signUp(String email, String password) async {
  final requestUri = Uri.https(baseUriDomain, 'api/sign-up');
  final requestBody = {'email': email, 'password': password};

  final response = await http.post(requestUri, body: requestBody);

  if (response.statusCode == 201) {
    return RESTResponse(message: '', success: true);
  } else {
    final responseBody = json.decode(response.body);
    final responseMessage = responseBody['message'];

    return RESTResponse(message: responseMessage, success: false);
  }
}
