class Weather {
  final Location location;
  final Current current;

  Weather({required this.location, required this.current});
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat; //latitude
  final double lon; //longitude
  final String tz_id;
  final int localtime_epoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tz_id,
    required this.localtime_epoch,
    required this.localtime,
  });
}

class Current {
  final int last_updated_epoch;
  final String last_updated;
  final double temp_c;
  final int is_day;
  final Condition condition;
  final double wind_kph;
  final String wind_dir;
  final int humidity;
  final int cloud;

  Current({
    required this.last_updated_epoch,
    required this.last_updated,
    required this.temp_c,
    required this.is_day,
    required this.condition,
    required this.wind_kph,
    required this.wind_dir,
    required this.humidity,
    required this.cloud,
  });
}

class Condition {
  final String text;
  final String icon;

  Condition({required this.text, required this.icon});
}
