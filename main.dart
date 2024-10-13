import 'dart:io';
import 'PersonRepository.dart';
import 'VehicleRepository.dart';
import 'ParkingSpaceRepository.dart';
import 'ParkingRepository.dart';
import 'Person.dart';
import 'Vehicle.dart';
import 'Parking.dart';
import 'ParkingSpace.dart';

void main() {
  var personRepo = PersonRepository();
  var vehicleRepo = VehicleRepository();
  var parkingSpaceRepo = ParkingSpaceRepository();
  var parkingRepo = ParkingRepository();

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

void handleVehicles(
    VehicleRepository vehicleRepo, PersonRepository personRepo) {
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
      stdout.write('Ange ny typ: ');
      vehicle.type = stdin.readLineSync()!;
      vehicleRepo.update(registrationNumber, vehicle);
      print('Fordonet har uppdaterats.');
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

void handleParkings(ParkingRepository repo, VehicleRepository vehicleRepo,
    ParkingSpaceRepository spaceRepo) {
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
        print(
            'Fordonet med registreringsnummer $registrationNumber hittades inte.');
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
        print('Parkeringen har uppdaterats');
      } else {
        print('Parkeringen med $registrationNumber hittades inte.');
      }
      break;
    case '4':
      stdout.write('Ange registreringsnummer för att ta bort: ');
      final registrationNumber = stdin.readLineSync()!;
      vehicleRepo.delete(registrationNumber);
      print('Parkeringen har tagits bort.');
      break;
    case '5':
      return;
    default:
      print('Ogiltigt alternativ.');
  }
}
