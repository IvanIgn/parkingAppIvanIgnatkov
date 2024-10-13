class ParkingSpace {
  String id;
  String address;
  double pricePerHour;

  ParkingSpace(this.id, this.address, this.pricePerHour);

  @override
  String toString() =>
      'ParkingSpace: ID: $id, Address: $address, Price: $pricePerHour';
}
