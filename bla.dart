/*import 'dart:io';

void main() {
  final personRepo = PersonRepository();
  final vehicleRepo = VehicleRepository();
  final parkingSpaceRepo = ParkingSpaceRepository();
  final parkingRepo = ParkingRepository();

  while (true) {
    print('\nVälkommen till Parkeringsappen!');
    print('Vad vill du hantera?');
    print('1. Personer');
    print('2. Fordon');
    print('3. Parkeringsplatser');
    print('4. Parkeringar');
    print('5. Avsluta');

    stdout.write('Välj ett alternativ (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        handlePersons(personRepo);
        break;
      case '2':
        handleVehicles(vehicleRepo, personRepo);
        break;
      case '3':
        handleParkingSpaces(parkingSpaceRepo);
        break;
      case '4':
        handleParkings(parkingRepo, vehicleRepo, parkingSpaceRepo);
        break;
      case '5':
        print('Avslutar programmet...');
        return;
      default:
        print('Ogiltigt alternativ, försök igen.');
    }
  }
}

void handlePersons(PersonRepository repo) {
  print('\nDu hanterar nu Personer. Vad vill du göra?');
  print('1. Skapa ny person');
  print('2. Visa alla personer');
  print('3. Uppdatera person');
  print('4. Ta bort person');
  print('5. Gå tillbaka');

  stdout.write('Välj ett alternativ (1-5): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write('Ange namn: ');
      final name = stdin.readLineSync()!;
      stdout.write('Ange personnummer: ');
      final personNumber = stdin.readLineSync()!;
      repo.add(Person(name, personNumber));
      print('Personen har skapats.');
      break;
    case '2':
      print('Alla personer:');
      repo.getAll().forEach(print);
      break;
    case '3':
      stdout.write('Ange personnummer för att uppdatera: ');
      final personNumber = stdin.readLineSync()!;
      final person = repo.getById(personNumber);
      if (person != null) {
        stdout.write('Ange nytt namn: ');
        person.name = stdin.readLineSync()!;
        repo.update(personNumber, person);
        print('Personen har uppdaterats.');
      } else {
        print('Personen hittades inte.');
      }
      break;
    case '4':
      stdout.write('Ange personnummer för att ta bort: ');
      final personNumber = stdin.readLineSync()!;
      repo.delete(personNumber);
      print('Personen har tagits bort.');
      break;
    case '5':
      return;
    default:
      print('Ogiltigt alternativ.');
  }
}

void handleVehicles(VehicleRepository vehicleRepo, PersonRepository personRepo) {
  print('\nDu hanterar nu Fordon. Vad vill du göra?');
  print('1. Skapa nytt fordon');
  print('2. Visa alla fordon');
  print('3. Uppdatera fordon');
  print('4. Ta bort fordon');
  print('5. Gå tillbaka');

  stdout.write('Välj ett alternativ (1-5): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write('Ange registreringsnummer: ');
      final registrationNumber = stdin.readLineSync()!;
      stdout.write('Ange typ (bil, motorcykel, etc.): ');
      final type = stdin.readLineSync()!;
      stdout.write('Ange ägarens personnummer: ');
      final personNumber = stdin.readLineSync()!;
      final owner = personRepo.getById(personNumber);
      if (owner != null) {
        vehicleRepo.add(Vehicle(registrationNumber, type, owner));
        print('Fordonet har skapats.');
      } else {
        print('Ägaren med personnummer $personNumber hittades inte.');
      }
      break;
    case '2':
      print('Alla fordon:');
      vehicleRepo.getAll().forEach(print);
      break;
    case '3':
      stdout.write('Ange registreringsnummer för att uppdatera: ');
      final registrationNumber = stdin.readLineSync()!;
      final vehicle = vehicleRepo.getById(registrationNumber);
      if (vehicle != null) {
        stdout.write('Ange ny typ: ');
        vehicle.type = stdin.readLineSync()!;
        vehicleRepo.update(registrationNumber, vehicle);
        print('Fordonet har uppdaterats.');
      } else {
        print('Fordonet hittades inte.');
      }
      break;
    case '4':
      stdout.write('Ange registreringsnummer för att ta bort: ');
      final registrationNumber = stdin.readLineSync()!;
      vehicleRepo.delete(registrationNumber);
      print('Fordonet har tagits bort.');
      break;
    case '5':
      return;
    default:
      print('Ogiltigt alternativ.');
  }
}

void handleParkingSpaces(ParkingSpaceRepository repo) {
  print('\nDu hanterar nu Parkeringsplatser. Vad vill du göra?');
  print('1. Skapa ny parkeringsplats');
  print('2. Visa alla parkeringsplatser');
  print('3. Uppdatera parkeringsplats');
  print('4. Ta bort parkeringsplats');
  print('5. Gå tillbaka');

  stdout.write('Välj ett alternativ (1-5): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write('Ange parkeringsplatsens ID: ');
      final id = stdin.readLineSync()!;
      stdout.write('Ange adress: ');
      final address = stdin.readLineSync()!;
      stdout.write('Ange pris per timme: ');
      final pricePerHour = double.parse(stdin.readLineSync()!);
      repo.add(ParkingSpace(id, address, pricePerHour));
      print('Parkeringsplatsen har skapats.');
      break;
    case '2':
      print('Alla parkeringsplatser:');
      repo.getAll().forEach(print);
      break;
    case '3':
      stdout.write('Ange ID för att uppdatera: ');
      final id = stdin.readLineSync()!;
      final space = repo.getById(id);
      if (space != null) {
        stdout.write('Ange ny adress: ');
        space.address = stdin.readLineSync()!;
        stdout.write('Ange nytt pris per timme: ');
        space.pricePerHour = double.parse(stdin.readLineSync()!);
        repo.update(id, space);
        print('Parkeringsplatsen har uppdaterats.');
      } else {
        print('Parkeringsplatsen hittades inte.');
      }
      break;
    case '4':
      stdout.write('Ange ID för att ta bort: ');
      final id = stdin.readLineSync()!;
      repo.delete(id);
      print('Parkeringsplatsen har tagits bort.');
      break;
    case '5':
      return;
    default:
      print('Ogiltigt alternativ.');
  }
}

void handleParkings(ParkingRepository repo, VehicleRepository vehicleRepo, ParkingSpaceRepository spaceRepo) {
  print('\nDu hanterar nu Parkeringar. Vad vill du göra?');
  print('1. Skapa ny parkering');
  print('2. Visa alla parkeringar');
  print('3. Uppdatera parkering');
  print('4. Ta bort parkering');
  print('5. Gå tillbaka');

  stdout.write('Välj ett alternativ (1-5): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write('Ange fordonets registreringsnummer: ');
      final registrationNumber = stdin.readLineSync()!;
      final vehicle = vehicleRepo.getById(registrationNumber);
      if (vehicle == null) {
        print('Fordonet med registreringsnummer $registrationNumber hittades inte.');
        break;
      }
      stdout.write('Ange parkeringsplatsens ID: ');
      final spaceId = stdin.readLineSync()!;
      final parkingSpace = spaceRepo.getById(spaceId);
      if (parkingSpace == null) {
        print('Parkeringsplatsen med ID $spaceId hittades inte.');
        break;
      }
      repo.add(Parking(vehicle, parkingSpace, DateTime.now()));
      print('Parkeringen har skapats.');
      break;
    case '2':
      print('Alla parkeringar:');
      repo.getAll().forEach(print);
      break;
    case '3':
      stdout.write('Ange registreringsnummer för parkering att uppdatera: ');
      final registrationNumber = stdin.readLineSync()!;
      final parking = repo.getByVehicleRegistration(registrationNumber);
      if (parking != null) {
        stdout.write('Ange ny sluttid (YYYY-MM-DD HH:MM): ');
        final newEndTime = DateTime.parse(stdin.readLineSync()!);
        parking.endTime = newEndTime;
        repo.update(registrationNumber, parking);
        print


        //////////////////////////////////////////////////
        ///
        ///
        ///
    class PersonRepository {
  final List<Person> _persons = [];

  void add(Person person) {
    _persons.add(person);
  }

  List<Person> getAll() {
    return List.unmodifiable(_persons);
  }

  Person? getById(String personNumber) {
    return _persons.firstWhere((person) => person.personNumber == personNumber, orElse: () => null);
  }

  void update(String personNumber, Person updatedPerson) {
    for (int i = 0; i < _persons.length; i++) {
      if (_persons[i].personNumber == personNumber) {
        _persons[i] = updatedPerson;
        return;
      }
    }
  }

  void delete(String personNumber) {
    _persons.removeWhere((person) => person.personNumber == personNumber);
  }
}

class VehicleRepository {
  final List<Vehicle> _vehicles = [];

  void add(Vehicle vehicle) {
    _vehicles.add(vehicle);
  }

  List<Vehicle> getAll() {
    return List.unmodifiable(_vehicles);
  }

  Vehicle? getById(String registrationNumber) {
    return _vehicles.firstWhere((vehicle) => vehicle.registrationNumber == registrationNumber, orElse: () => null);
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
    _vehicles.removeWhere((vehicle) => vehicle.registrationNumber == registrationNumber);
  }
}

class ParkingSpaceRepository {
  final List<ParkingSpace> _parkingSpaces = [];

  void add(ParkingSpace parkingSpace) {
    _parkingSpaces.add(parkingSpace);
  }

  List<ParkingSpace> getAll() {
    return List.unmodifiable(_parkingSpaces);
  }

  ParkingSpace? getById(String id) {
    return _parkingSpaces.firstWhere((space) => space.id == id, orElse: () => null);
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

class ParkingRepository {
  final List<Parking> _parkings = [];

  void add(Parking parking) {
    _parkings.add(parking);
  }

  List<Parking> getAll() {
    return List.unmodifiable(_parkings);
  }

  Parking? getByVehicleRegistration(String registrationNumber) {
    return _parkings.firstWhere((parking) => parking.vehicle.registrationNumber == registrationNumber, orElse: () => null);
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
    _parkings.removeWhere((parking) => parking.vehicle.registrationNumber == registrationNumber);
  }
}

/////////////////////////////////////////////////////
///
///
///
///class Person {
  String name;
  String personNumber;

  Person(this.name, this.personNumber);

  @override
  String toString() => 'Person: $name, ID: $personNumber';
}

class Vehicle {
  String registrationNumber;
  String type;
  Person owner;

  Vehicle(this.registrationNumber, this.type, this.owner);

  @override
  String toString() =>
      'Vehicle: $registrationNumber, Type: $type, Owner: ${owner.name}';
}

class ParkingSpace {
  String id;
  String address;
  double pricePerHour;

  ParkingSpace(this.id, this.address, this.pricePerHour);

  @override
  String toString() =>
      'ParkingSpace: ID: $id, Address: $address, Price: $pricePerHour';
}

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

*/