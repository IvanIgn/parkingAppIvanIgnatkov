import 'ParkingSpace.dart';
import 'Vehicle.dart';

String generateID() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}

class Parking {
  Parking({
    required this.vehicle,
    required this.parkingSpace,
    required this.startTime,
    required this.endTime,
    String? id,
  }) : id = id ?? generateID();

  final String id;
  final Vehicle vehicle;
  final ParkingSpace parkingSpace;
  final DateTime startTime;
  DateTime endTime;

  Duration get time => endTime.difference(startTime);
//  get time => null;
}




/* double calculateCost() {
    if (endTime == null) return 0.0;
    Duration duration = endTime!.difference(startTime);
    double totalHours = duration.inMinutes / 60.0;
    return totalHours * parkingSpace.pricePerHour;
  }
  */