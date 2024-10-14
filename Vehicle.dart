import 'Person.dart';

class Vehicle {
  Vehicle({
    required this.registrationNumber,
    required this.type,
    required this.owner,
  });

  final String registrationNumber;
  late final String type;
  final Person owner;

  // Serialisering: Konvertera ett objekt till JSON
  Map<String, dynamic> toJson() {
    return {
      'registrationNumber': registrationNumber,
      'type': type,
      'owner': owner.toJson(), // Serialisera Person-objektet
    };
  }

  // Deserialisering: Skapa ett objekt från JSON
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      registrationNumber: json['registrationNumber'] as String,
      type: json['type'] as String,
      owner: Person.fromJson(json['owner']
          as Map<String, dynamic>), // Deserialisera Person-objektet
    );
  }
}
