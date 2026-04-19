import 'package:izpi_exchange/core/rest/rest.constants.dart';

Uri createRequestUri(String endpoint) {
  return useHttps ? Uri.https(baseUriDomain, endpoint) : Uri.http(baseUriDomain, endpoint);
}
