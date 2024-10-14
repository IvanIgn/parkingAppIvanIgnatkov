class ParkingSpace {
  ParkingSpace({
    required this.address,
    required this.pricePerHour,
    String? id,
  }) : id = id ?? generateID();

  final String id;
  String address;
  double pricePerHour;
}

String generateID() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}
