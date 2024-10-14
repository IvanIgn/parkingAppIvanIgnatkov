import 'Parking.dart';
import 'ParkingSpace.dart';

class ParkingSpaceRepository {
  static final ParkingSpaceRepository _instance =
      ParkingSpaceRepository._internal();
  final List<ParkingSpace> _parkingSpaces = [];
  static ParkingSpaceRepository get instance => _instance;
  ParkingSpaceRepository._internal();

  final List<ParkingSpace> parkingSpacesList = [
    ParkingSpace(
      id: '1',
      address: 'Gata 20, 123 45 Stockholm',
      pricePerHour: 50,
    )
  ];

  void addParkingSpace(ParkingSpace parkingSpace) {
    _parkingSpaces.add(parkingSpace);
  }

  List<ParkingSpace> getAllParkingSpaces() {
    return List.unmodifiable(_parkingSpaces);
  }

  ParkingSpace? getParkingSpaceById(String id) {
    for (var parkingSpace in parkingSpacesList) {
      if (parkingSpace.id == id) {
        print(
            // 'Vehicle: ${parking.vehicle.registrationNumber}, Type: ${parking.vehicle.type}, Owner: ${parking.vehicle.owner.name}, Personnummer: ${parking.vehicle.owner.personNumber}');
            'Parking: ${parkingSpace.id}, Address: ${parkingSpace.address}, Price per hour: ${parkingSpace.pricePerHour}');
        return parkingSpace;
      }
    }
    print('Fel: ParkingSpace med id $id hittades inte');
    return null;
  }

  // void updateParkingSpace(String id, ParkingSpace updatedParkingSpace) {
  //   for (int i = 0; i < _parkingSpaces.length; i++) {
  //     if (_parkingSpaces[i].id == id) {
  //       _parkingSpaces[i] = updatedParkingSpace;
  //       return;
  //     }
  //   }
  // }

  void updateParkingSpace(String id, ParkingSpace updatedParkingSpace) {
    final index = parkingSpacesList.indexWhere((p) => p.id == id);
    if (index != -1) {
      parkingSpacesList[index] = updatedParkingSpace;
      print('Parkeringsplats med id $id uppdaterad.');
    } else {
      print('Parkeringsplats med id $id hittades inte.');
    }
  }

//   void deleteParkingSpace(String id) {
//     _parkingSpaces.removeWhere((space) => space.id == id);
//   }
// }

  void deleteParkingSpace(String parkingID) {
    final index =
        parkingSpacesList.indexWhere((parking) => parking.id == parkingID);
    if (index != -1) {
      parkingSpacesList.removeAt(index);
      print('Parkeringsplats med id $parkingID borttagen.');
    } else {
      print('Parkeringsplats med id $parkingID hittades inte.');
    }
  }
}
