class CountryStats {
  String provinceState;
  String countryRegion;
  String lastUpdate;
  String confirmed;
  String deaths;
  String recovered;
  String latitude;
  String longitude;

  CountryStats(
      {this.provinceState,
      this.countryRegion,
      this.lastUpdate,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.latitude,
      this.longitude});

  CountryStats.fromJson(Map<String, dynamic> json) {
    provinceState = json['provinceState'];
    countryRegion = json['countryRegion'];
    lastUpdate = json['lastUpdate'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinceState'] = this.provinceState;
    data['countryRegion'] = this.countryRegion;
    data['lastUpdate'] = this.lastUpdate;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
