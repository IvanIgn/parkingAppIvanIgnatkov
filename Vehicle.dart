import 'Person.dart';

class Vehicle {
  String registrationNumber;
  String type;
  Person owner;

  Vehicle(this.registrationNumber, this.type, this.owner);

  @override
  String toString() =>
      'Vehicle: $registrationNumber, Type: $type, Owner: ${owner.name}';
}
