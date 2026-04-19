final String baseUriDomain = String.fromEnvironment('API_DOMAIN', defaultValue: 'localhost:3001');

final bool useHttps = bool.fromEnvironment("USE_HTTPS", defaultValue: false);
