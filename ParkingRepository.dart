//import 'dart:io';

import 'Person.dart';
import 'Vehicle.dart';
import 'Parking.dart';
import 'ParkingSpace.dart';
//import 'VehicleRepository.dart';

//import 'VehicleRepository.dart';
//import 'ParkingSpaceRepository.dart';

class ParkingRepository {
  final List<Parking> _parkings = [];

  void add(Parking parking) {
    _parkings.add(parking);
  }

  List<Parking> getAll() {
    return List.unmodifiable(_parkings);
  }

  Parking getByVehicleRegistration(String registrationNumber) {
    return _parkings.firstWhere(
      (parking) => parking.vehicle.registrationNumber == registrationNumber,
      orElse: () {
        print('Parking with registration number $registrationNumber not found');
        return Parking(
          Vehicle('unknown', 'unknown', Person('unknown', '000000-0000')),
          ParkingSpace('unknown', 'unknown address', 0.0),
          DateTime.now(),
        ); // Возвращаем объект-заглушку вместо null
      },
    );
  }

  void update(String registrationNumber, Parking updatedParking) {
    for (int i = 0; i < _parkings.length; i++) {
      if (_parkings[i].vehicle.registrationNumber == registrationNumber) {
        _parkings[i] = updatedParking;
        return;
      }
    }
  }

  void delete(String registrationNumber) {
    _parkings.removeWhere(
        (parking) => parking.vehicle.registrationNumber == registrationNumber);
  }
}
