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
}
