import 'dart:convert';

import 'package:corona_tracker/models/CountryStats.dart';
import 'package:corona_tracker/models/GlobalStats.dart';
import 'package:corona_tracker/services/api.dart';
import 'package:http/http.dart' as http;

class APIService {
  final API api;

  APIService(this.api);

  Future<GlobalStats> getGlobalStatsData() async {
    final uri = api.endpointUri(Endpoint.all_stats);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return GlobalStats.fromJson(json.decode(response.body));
    }
    print(
        'Request: $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

  Future<List<CountryStats>> getCountryStatsData(String uri) async {
    List<CountryStats> countryStatsList;
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      if (data.length > 0)
        countryStatsList = data.map((i) => CountryStats.fromJson(i)).toList();

      return countryStatsList;
    }
    print(
        'Request: $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
