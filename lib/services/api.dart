enum Endpoint {
  all_stats,
}

class API {
  static String host = 'covid19.mathdro.id';

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: '/${_paths[endpoint]}',
      );

  static Map<Endpoint, String> _paths = {
    Endpoint.all_stats: 'api',
  };
}
