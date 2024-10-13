//import 'dart:io';
import 'Vehicle.dart';
//import 'PersonRepository.dart';
//import 'VehicleRepository.dart';

class VehicleRepository {
  final List<Vehicle> _vehicles = [];

  void add(Vehicle vehicle) {
    _vehicles.add(vehicle);
  }

  List<Vehicle> getAll() {
    return List.unmodifiable(_vehicles);
  }

  Vehicle getById(String registrationNumber) {
    return _vehicles.firstWhere(
      (vehicle) => vehicle.registrationNumber == registrationNumber,
      orElse: () {
        print('Vehicle with registrationNumber $registrationNumber not found');
        return _vehicles.first;
      },
    );
  }

  void update(String registrationNumber, Vehicle updatedVehicle) {
    for (int i = 0; i < _vehicles.length; i++) {
      if (_vehicles[i].registrationNumber == registrationNumber) {
        _vehicles[i] = updatedVehicle;
        return;
      }
    }
  }

  void delete(String registrationNumber) {
    _vehicles.removeWhere(
        (vehicle) => vehicle.registrationNumber == registrationNumber);
  }
}
