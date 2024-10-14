class ParkingSpace {
  ParkingSpace({
    required this.address,
    required this.pricePerHour,
    String? id,
  }) : id = id ?? generateID();

  final String id;
  String address;
  double pricePerHour;

  // Serialisering: Konvertera ett objekt till JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'pricePerHour': pricePerHour,
    };
  }

  // Deserialisering: Skapa ett objekt från JSON
  factory ParkingSpace.fromJson(Map<String, dynamic> json) {
    return ParkingSpace(
      id: json['id'] as String,
      address: json['address'] as String,
      pricePerHour: json['pricePerHour'] as double,
    );
  }
}

String generateID() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}
