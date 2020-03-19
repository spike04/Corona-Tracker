import 'package:corona_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:corona_tracker/bloc/StatProvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<StatsProvider>(context, listen: false).getGlobalStats();
  }

  @override
  Widget build(BuildContext context) {
    final appStats = Provider.of<StatsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (!appStats.isLoading)
              return _displayGlobalStats(context, appStats);
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }

  Widget _displayGlobalStats(
      BuildContext context, StatsProvider statsProvider) {
    final data = statsProvider.globalStats;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/covid19.png',
              fit: BoxFit.contain,
              width: 140,
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Last Updated: ${formatDate(data.lastUpdate)}'),
              GestureDetector(
                child: Icon(Icons.refresh),
                onTap: () async {
                  statsProvider.loadingStats();
                  await statsProvider.getGlobalStats();
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        // Image.network('${data.image}'),
        GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 4),
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          childAspectRatio: 3 / 2.4,
          shrinkWrap: true,
          children: <Widget>[
            renderInfoCard('Total Cases', data.confirmed.value),
            renderInfoCard('Recovered', data.recovered.value),
            renderInfoCard('Deaths', data.deaths.value),
          ],
        ),
        SizedBox(height: 10),
        _loadCountryWiseData(statsProvider),
      ],
    );
  }

  _loadCountryWiseData(StatsProvider data) {
    // if (data.countryStatsList != null) {
    return data.countryStatsList == null
        ? Center(
            child: Text('Loading...'),
          )
        : Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                sortAscending: true,
                columnSpacing: 20,
                dataRowHeight: 80,
                columns: [
                  DataColumn(
                    label: Text(
                      'Place',
                      style: TextStyle(
                        color: Color(0xff19de92).withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Confirmed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Deaths',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Recovered',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: data.countryStatsList
                    .map(
                      (i) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              renderAddress(i),
                              style: TextStyle(
                                color: Color(0xff19de92).withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('${i.confirmed}'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('${i.deaths}'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('${i.recovered}'),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          );
  }
}
