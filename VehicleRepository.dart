//import 'dart:io';
import 'Vehicle.dart';
//import 'PersonRepository.dart';
//import 'VehicleRepository.dart';

class VehicleRepository {
  static final VehicleRepository _instance = VehicleRepository._internal();
  static VehicleRepository get instance => _instance;
  VehicleRepository._internal();

  final List<Vehicle> vehiclesList = [
    //  Vehicle(
    //    registrationNumber: '0000',
    //   type: 'Car',
    //   owner: Person(
    //    name: 'Jonn Johnson',
    //    personNumber: '12345678902',
    //  ),
    //  )
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
            'Fordon: ${vehicle.registrationNumber}\n , Typ: ${vehicle.type}\n , Ägare: ${vehicle.owner.name}\n , Personnummer: ${vehicle.owner.personNumber}\n ');
      }
    } else {
      print('Finns inga fordon i listan');
    }
  }

  Vehicle? getVehicleByRegistrationNumber(String registrationNumber) {
    for (var vehicle in vehiclesList) {
      if (vehicle.registrationNumber == registrationNumber) {
        print(
            'Fordon: ${vehicle.registrationNumber}, Typ: ${vehicle.type}, "Ägare": ${vehicle.owner.name}, Personnummer: ${vehicle.owner.personNumber}');

        return vehicle;
      }
    }
    print(
        'Fel: Fordon med registreringsnummer $registrationNumber hittades inte');
    return null;
  }

  void updateVehicle(String registrationNumber, Vehicle updatedVehicle) {
    final index = vehiclesList
        .indexWhere((v) => v.registrationNumber == registrationNumber);
    if (index != -1) {
      vehiclesList[index] = updatedVehicle;
      print('Fordon ${updatedVehicle.registrationNumber} uppdaterad.');
    } else {
      print(
          'Fel: Fordon med registreringsnummer ${updatedVehicle.registrationNumber} hittades inte.');
    }
    vehiclesList[index] = updatedVehicle;
  }

  void deleteVehicle(String registrationNumber) {
    vehiclesList.removeWhere(
        (vehicle) => vehicle.registrationNumber == registrationNumber);
  }
}
