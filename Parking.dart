import 'ParkingSpace.dart';
import 'Vehicle.dart';

String generateID() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}

class Parking {
  Parking({
    required this.vehicle,
    required this.parkingSpace,
    required this.startTime,
    required this.endTime,
    String? id,
  }) : id = id ?? generateID();

  final String id;
  final Vehicle vehicle;
  final ParkingSpace parkingSpace;
  final DateTime startTime;
  DateTime endTime;

  Duration get time => endTime.difference(startTime);

  // Serialisering: Konvertera ett objekt till JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicle': vehicle.toJson(), // Serialisera Vehicle-objektet
      'parkingSpace':
          parkingSpace.toJson(), // Serialisera ParkingSpace-objektet
      'startTime':
          startTime.toIso8601String(), // Konvertera DateTime till ISO-sträng
      'endTime': endTime
          .toIso8601String(), // Konvertera DateTime till ISO-sträng eller null
    };
  }

  // Deserialisering: Skapa ett objekt från JSON
  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
      vehicle: Vehicle.fromJson(json['vehicle']
          as Map<String, dynamic>), // Deserialisera Vehicle-objektet
      parkingSpace: ParkingSpace.fromJson(json['parkingSpace']
          as Map<String, dynamic>), // Deserialisera ParkingSpace-objektet
      startTime: DateTime.parse(
          json['startTime'] as String), // Konvertera ISO-sträng till DateTime
      endTime: json['endTime'] != null
          ? DateTime.parse(json['endTime'] as String)
          : DateTime.now(), // Hantera null för sluttid
    );
  }
}
