//import 'dart:io';
import 'ParkingSpace.dart';

class ParkingSpaceRepository {
  final List<ParkingSpace> _parkingSpaces = [];

  void add(ParkingSpace parkingSpace) {
    _parkingSpaces.add(parkingSpace);
  }

  List<ParkingSpace> getAll() {
    return List.unmodifiable(_parkingSpaces);
  }

  ParkingSpace? getById(String id) {
    return _parkingSpaces.firstWhere(
      (space) => space.id == id,
      orElse: () => throw Exception('ParkingSpace with ID: $id not found'),
    );
  }

  void update(String id, ParkingSpace updatedParkingSpace) {
    for (int i = 0; i < _parkingSpaces.length; i++) {
      if (_parkingSpaces[i].id == id) {
        _parkingSpaces[i] = updatedParkingSpace;
        return;
      }
    }
  }

  void delete(String id) {
    _parkingSpaces.removeWhere((space) => space.id == id);
  }
}
