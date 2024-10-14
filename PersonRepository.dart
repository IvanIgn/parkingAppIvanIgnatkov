import 'Person.dart';

class PersonRepository {
  static final PersonRepository _instance = PersonRepository._internal();
  static PersonRepository get instance => _instance;
  PersonRepository._internal();

  final List<Person> _personsList = [
    // Person(name: 'Namn', personNumber: '000000-0000')
  ];

  void addPerson(Person person) {
    _personsList.add(person);
    print('Person ${person.name} added.');
  }

  void getAllPersons() {
    if (_personsList.isNotEmpty) {
      for (var person in _personsList) {
        // print('Person: ${person.name}, personnummer: ${person.personNumber}');
        print('Person: ${person.name}\nPersonnummer: ${person.personNumber}\n');
      }
    } else {
      print('Finns inga personer i listan');
      //  }
      // return Person(name: 'Unknown', personNumber: '000000-0000');
    }
  }

  Person? getPersonByPersonNumber(String personNumber) {
    for (var person in _personsList) {
      if (person.personNumber == personNumber) {
        print('Person: ${person.name}, personnummer: ${person.personNumber}');
        return person;
      }
    }
    print('Fel: Person med personnummer $personNumber hittades inte');
    return null;
  }

  void updatePerson(Person updatedPerson) {
    final index = _personsList
        .indexWhere((p) => p.personNumber == updatedPerson.personNumber);
    if (index != -1) {
      _personsList[index] = updatedPerson;
      print('Person ${updatedPerson.name} uppdaterades.');
    } else {
      print(
          'Fel: Person med personnummer ${updatedPerson.personNumber} hittades inte.');
    }
  }

  void deletePerson(String personNumber) {
    final index =
        _personsList.indexWhere((p) => p.personNumber == personNumber);
    if (index != -1) {
      _personsList.removeAt(index);
      print('Person med personnummer $personNumber togs bort.');
    } else {
      print('Fel: Person med personNumber $personNumber hittades inte.');
    }
  }
}
