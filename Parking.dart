import 'ParkingSpace.dart';
import 'Vehicle.dart';

/* double calculateCost() {
    if (endTime == null) return 0.0;
    Duration duration = endTime!.difference(startTime);
    double totalHours = duration.inMinutes / 60.0;
    return totalHours * parkingSpace.pricePerHour;
  }
  */

class Parking {
  Vehicle vehicle;
  ParkingSpace parkingSpace;
  DateTime startTime;
  DateTime? endTime;

  Parking(this.vehicle, this.parkingSpace, this.startTime, [this.endTime]);

  @override
  String toString() {
    return 'Parking: Vehicle ${vehicle.registrationNumber} at ${parkingSpace.address} from $startTime ${endTime != null ? "to $endTime" : "(ongoing)"}';
  }
}
