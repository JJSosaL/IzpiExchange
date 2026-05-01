import 'package:flutter/foundation.dart';

final String baseUriDomain = kDebugMode
    ? 'localhost:3001'
    : String.fromEnvironment('API_DOMAIN', defaultValue: 'izpiexchange.fancystudio.xyz');

final bool useHttps = kDebugMode ? false : bool.fromEnvironment('USE_HTTPS', defaultValue: true);
