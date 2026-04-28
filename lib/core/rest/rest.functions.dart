import 'package:izpi_exchange/core/rest/rest.constants.dart';

Uri createRequestUri(String endpoint) {
  if (useHttps) {
    return Uri.https(baseUriDomain, endpoint);
  }

  return Uri.http(baseUriDomain, endpoint);
}
