class Location {
  final int locationId;
  final int buildingId;
  final String locationName;
  final String description;

  Location({
    required this.locationId,
    required this.buildingId,
    required this.locationName,
    required this.description,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      locationId: json['location_id'],
      buildingId: json['building_id'],
      locationName: json['location_name'],
      description: json['description'],
    );
  }
}