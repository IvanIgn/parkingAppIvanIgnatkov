// ignore: file_names
import 'Parking.dart';
import 'VehicleRepository.dart';
import 'ParkingSpaceRepository.dart';

class ParkingRepository {
  static final ParkingRepository _instance = ParkingRepository._internal();
  static ParkingRepository get instance => _instance;

  ParkingRepository._internal();
  final List<Parking> _parkingsList = [];

  final VehicleRepository vehicleRepository = VehicleRepository.instance;
  final ParkingSpaceRepository parkingSpaceRepository =
      ParkingSpaceRepository.instance;

  void addParking(String regNr, String parkingPlaceId, DateTime endTime) {
    try {
      final addVehicle = vehicleRepository.vehiclesList.firstWhere(
          (vehicle) =>
              vehicle.registrationNumber.toUpperCase() == regNr.toUpperCase(),
          orElse: () => throw Exception('Vehicle not found'));

      final addParkingSpace = parkingSpaceRepository.parkingSpacesList
          .firstWhere((p) => p.id == parkingPlaceId,
              orElse: () => throw Exception('Parking space not found'));

      final addParking = Parking(
        vehicle: addVehicle,
        parkingSpace: addParkingSpace,
        startTime: DateTime.now(),
        endTime: endTime,
      );

      _parkingsList.add(addParking);
      print(endTime);
      _calculateDuration(
          DateTime.now(), endTime, addParkingSpace.pricePerHour.toDouble());
    } catch (e) {
      print('Ett fel uppstod: $e');
      getBackToMainPage('Ett fel uppstod: $e');
    }
  }

  void getBackToMainPage(String message) {
    print(message);
  }

  void getAllParkings() {
    if (_parkingsList.isNotEmpty) {
      for (var parking in _parkingsList) {
        print(
            'Parkering: ${parking.vehicle.registrationNumber}, Typ: ${parking.vehicle.type}, Ägare: ${parking.vehicle.owner.name}, Personnummer: ${parking.vehicle.owner.personNumber}, Parkeringsplats: ${parking.parkingSpace.id}, Adress: ${parking.parkingSpace.address}, Tid: ${parking.time}');
      }
    } else {
      print('Finns inga parkeringar i listan');
    }
  }

  Parking? getParkingByVehicleRegistration(String registrationNumber) {
    for (var parking in _parkingsList) {
      if (parking.vehicle.registrationNumber == registrationNumber) {
        print(
            'Vehicle: ${parking.vehicle.registrationNumber}, Type: ${parking.vehicle.type}, Owner: ${parking.vehicle.owner.name}, Personnummer: ${parking.vehicle.owner.personNumber}');

        return parking;
      }
    }
    print(
        'Fel: Fordon med registreringsnummer $registrationNumber hittades inte');
    return null;
  }

  void _calculateDuration(
      DateTime startTime, DateTime endTime, double pricePerHour) {
    final duration = endTime.difference(startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final totalCost = hours * pricePerHour + (minutes / 60) * pricePerHour;
    print('Total kostnad: $totalCost');
  }

  void updateParking(String registrationNumber, Parking updatedParking) {
    final index = _parkingsList.indexWhere(
        (parking) => parking.vehicle.registrationNumber == registrationNumber);
    if (index != -1) {
      _parkingsList[index] = updatedParking;
      print('Parkering för $registrationNumber uppdaterad.');
    } else {
      print('Parkering för $registrationNumber hittades inte.');
    }
  }

  void deleteParking(String registrationNumber) {
    final index = _parkingsList.indexWhere(
        (parking) => parking.vehicle.registrationNumber == registrationNumber);
    if (index != -1) {
      _parkingsList.removeAt(index);
      print('Parkering med registreringsnummer $registrationNumber borttagen.');
    } else {
      print(
          'Parkering med registreringsnummer $registrationNumber hittades inte.');
    }
  }
}


/*
  void addParking(Parking parking) {
    _parkingsList.add(parking);
    print('Parkering för ${parking.vehicle.registrationNumber} tillagd.');
  }
*/

  // void addParking(Parking parking) {
  //   _parkingsList.add(parking);
  //   print('Parkering för ${parking.vehicle.registrationNumber} tillagd.');
  // }

/*
  void addParking(String regNumber, String parkingSpaceID, DateTime endTime) {
    try {
      final addVehicle = vehicleRepository._vehiclesList
          .where((vehicle) =>
              vehicle.regNr.toUpperCase() == regNumber.toUpperCase())
          .first;

      final addParkingSpace = parkingSpaceRepository.parkingSpacesList
          .where((p) => p.id == parkingSpaceID)
          .first;

      final addParking = Parking(
        vehicle: addVehicle,
        parkingSpace: addParkingSpace,
        startTime: DateTime.now(),
        endTime: endTime,
      );

      _parkingsList.add(addParking);
      print(endTime);
      _calculateDuration(DateTime.now(), endTime, addParkingSpace.pricePerHour);
    } catch (err) {
      print(err);
      getBackToMainPage(
          'Det gick fel, du omdirigeras till startsidan, se till att du lagt till personer, fordon och parkeringsplatser innan du forsätter!');
    }
  }
*/

  // void getParkingByVehicleRegistration(String registrationNumber) {
  //   final parking = _parkingsList.firstWhere(
  //     (parking) => parking.vehicle.registrationNumber == registrationNumber,
  //     orElse: () {
  //       print(
  //           'Parkering med registreringsnummer $registrationNumber hittades inte');
  //       return Parking(
  //         vehicle: Vehicle(
  //           registrationNumber: '0000',
  //           type: 'Car',
  //           owner: Person(
  //             name: 'Jonn Johnson',
  //             personNumber: '12345678902',
  //           ),
  //         ),
  //         parkingSpace: ParkingSpace('0000', 'unknown address', 0.0),
  //         startTime: DateTime.now(),
  //         endTime: DateTime.now().add(Duration(hours: 1)),
  //       );
  //     },
  //   );
  //   print(
  //       'Parkering: ${parking.vehicle.registrationNumber}, Typ: ${parking.vehicle.type}, Ägare: ${parking.vehicle.owner.name}, Personnummer: ${parking.vehicle.owner.personNumber}, Parkeringsplats: ${parking.parkingSpace.id}, Adress: ${parking.parkingSpace.address}, Tid: ${parking.time}');
  // }


  /*
  void updateParking(String registrationNumber, Parking updatedParking) {
    for (int i = 0; i < _parkingsList.length; i++) {
      if (_parkingsList[i].vehicle.registrationNumber == registrationNumber) {
        _parkingsList[i] = updatedParking;
        return;
      }
    }
  }
*/
  // void deleteParking(String registrationNumber) {
  //   _parkingsList.removeWhere(
  //       (parking) => parking.vehicle.registrationNumber == registrationNumber);
  // }