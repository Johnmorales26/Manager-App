class Building {
  final int buildingId;
  final String buildingName;
  final String address;

  Building({
    required this.buildingId,
    required this.buildingName,
    required this.address,
  });

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      buildingId: json['building_id'],
      buildingName: json['building_name'],
      address: json['address'],
    );
  }
}