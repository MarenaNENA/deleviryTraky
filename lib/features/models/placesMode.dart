class placesModel {
  final String name;
  final String displayname;
  final double lat;
  final double lon;

  placesModel({
    required this.name,
    required this.displayname,
    required this.lat,
    required this.lon,
  });

  factory placesModel.fromJson(Map<String, dynamic> json) {
    return placesModel(
      name: json['name'],
      displayname: json['display_name'],
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
    );
  }
}
