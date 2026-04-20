final String baseUriDomainFromEnv = String.fromEnvironment('API_DOMAIN');
final String baseUriDomain = baseUriDomainFromEnv.isEmpty ? 'localhost:3001' : baseUriDomainFromEnv;

final bool useHttps = bool.fromEnvironment('USE_HTTPS');
