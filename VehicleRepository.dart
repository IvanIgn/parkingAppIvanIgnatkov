//import 'dart:io';
import 'Vehicle.dart';
import 'Person.dart';
//import 'PersonRepository.dart';
//import 'VehicleRepository.dart';

class VehicleRepository {
  static final VehicleRepository _instance = VehicleRepository._internal();
  static VehicleRepository get instance => _instance;
  VehicleRepository._internal();

  final List<Vehicle> vehiclesList = [
    Vehicle(
      registrationNumber: '0000',
      type: 'Car',
      owner: Person(
        name: 'Jonn Johnson',
        personNumber: '12345678902',
      ),
    )
  ];

  void addVehicle(Vehicle vehicle) {
    vehiclesList.add(vehicle);
  }

  // List<Vehicle> getAllVehicles() {
  //  return _vehiclesList;
  // }

  void getAllVehicles() {
    if (vehiclesList.isNotEmpty) {
      for (var vehicle in vehiclesList) {
        print(
            'Vehicle: ${vehicle.registrationNumber}\n , Type: ${vehicle.type}\n , Owner: ${vehicle.owner.name}\n , Personnummer: ${vehicle.owner.personNumber}\n ');
      }
    } else {
      print('Finns inga fordon i listan');
    }
  }

/*
  Vehicle getVehicleByRegistrationID(String registrationNumber) {
    return _vehiclesList.firstWhere(
      (vehicle) => vehicle.registrationNumber == registrationNumber,
      orElse: () {
        print(
            'Vehicle med registreringsnummer $registrationNumber hittades inte');
        return Vehicle('unknown', 'unknown', Person('unknown', '000000-0000'));
      },
    );
  }
*/
/*
  void getVehicleByRegistrationNumber(String registrationNumber) {
    final vehicle = _vehiclesList.firstWhere(
      (vehicle) => vehicle.registrationNumber == registrationNumber,
      orElse: () {
        print(
            'Vehicle med registreringsnummer $registrationNumber hittades inte');
        return Vehicle(
          registrationNumber: 'unknown',
          type: 'unknown',
          owner: Person(name: 'unknown', personNumber: '000000-0000'),
        );
      },
    );
    print(
        'Vehicle: ${vehicle.registrationNumber}, Type: ${vehicle.type}, Owner: ${vehicle.owner.name}, Personnummer: ${vehicle.owner.personNumber}');
  }

  */
/*
  void updateVehicle(String registrationNumber, Vehicle updatedVehicle) {
    for (int i = 0; i < _vehiclesList.length; i++) {
      if (_vehiclesList[i].registrationNumber == registrationNumber) {
        _vehiclesList[i] = updatedVehicle;
        return;
      }
    }
  }
*/

/*
  Vehicle? getVehicleByRegistrationNumber(String registrationNumber) {
    final vehicle = _vehiclesList.firstWhere(
      (vehicle) => vehicle.registrationNumber == registrationNumber,
      orElse: () {
        print(
            'Vehicle med registreringsnummer $registrationNumber hittades inte');
        return Vehicle(
          registrationNumber: 'unknown',
          type: 'unknown',
          owner: Person(name: 'unknown', personNumber: '000000-0000'),
        );
      },
    );
    print(
        'Vehicle: ${vehicle.registrationNumber}, Type: ${vehicle.type}, Owner: ${vehicle.owner.name}, Personnummer: ${vehicle.owner.personNumber}');
  }
*/

  Vehicle? getVehicleByRegistrationNumber(String registrationNumber) {
    for (var vehicle in vehiclesList) {
      if (vehicle.registrationNumber == registrationNumber) {
        print(
            'Vehicle: ${vehicle.registrationNumber}, Type: ${vehicle.type}, Owner: ${vehicle.owner.name}, Personnummer: ${vehicle.owner.personNumber}');

        return vehicle;
      }
    }
    print(
        'Ошибка: Fordon med registreringsnummer $registrationNumber hittades inte');
    return null;
  }

  void updateVehicle(String registrationNumber, Vehicle updatedVehicle) {
    final index = vehiclesList
        .indexWhere((v) => v.registrationNumber == registrationNumber);
    if (index != -1) {
      vehiclesList[index] = updatedVehicle;
      print('Vehicle ${updatedVehicle.registrationNumber} updated.');
    } else {
      print(
          'Fel: Vehicle med registreringsnummer ${updatedVehicle.registrationNumber} hittades inte.');
    }
  }

  void deleteVehicle(String registrationNumber) {
    vehiclesList.removeWhere(
        (vehicle) => vehicle.registrationNumber == registrationNumber);
  }
}
