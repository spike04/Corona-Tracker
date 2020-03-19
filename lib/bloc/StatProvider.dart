import 'package:corona_tracker/models/CountryStats.dart';
import 'package:corona_tracker/models/GlobalStats.dart';
import 'package:corona_tracker/services/api.dart';
import 'package:corona_tracker/services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class StatsProvider with ChangeNotifier {
  final _api = APIService(API());
  GlobalStats globalStats;
  List<CountryStats> countryStatsList;
  CountryStats countryMap;

  bool isLoading = true;
  bool isLoadingCountryMap = true;

  Future<void> getGlobalStats() async {
    globalStats = await _api.getGlobalStatsData();
    isLoading = false;
    notifyListeners();

    getCountryStats();
  }

  Future<void> getCountryStats() async {
    final now = DateTime.now();
    var url = globalStats.dailyTimeSeries.pattern.replaceAll(
        '[dateString]',
        DateFormat('M-dd-yyyy')
            .format(DateTime(now.year, now.month, now.day - 1)));
    countryStatsList = await _api.getCountryStatsData(url);
    notifyListeners();
  }

  void loadingStats() {
    isLoading = true;
    notifyListeners();
  }

  void loadingStateCountry() {
    isLoadingCountryMap = true;
    notifyListeners();
  }
}
