import 'Person.dart';

class PersonRepository {
  static final PersonRepository _instance = PersonRepository._internal();
  static PersonRepository get instance => _instance;
  PersonRepository._internal();

  final List<Person> _personsList = [
    Person(name: 'Namn', personNumber: '000000-0000')
  ];

  void addPerson(Person person) {
    _personsList.add(person);
    print('Person ${person.name} added.');
  }

/*
  void getAllPersons() {
    if (_personsList.isNotEmpty) {
      for (var person in _personsList) {
        print('Person: ${person.name}, personnummer: ${person.personNumber}');
      }
    } else {
      print('Finns inga personer i listan');
    }
  }
*/

  void getAllPersons() {
    if (_personsList.isNotEmpty) {
      for (var person in _personsList) {
        // print('Person: ${person.name}, personnummer: ${person.personNumber}');
        print(
            'Person: ${person.name}\n  Personnummer: ${person.personNumber}\n');
      }
    } else {
      print('Finns inga personer i listan');
      //  }
      // return Person(name: 'Unknown', personNumber: '000000-0000');
    }
  }

/*
  void getPersonByPersonNumber(String personNumber) {
    final person = c.firstWhere(
      (person) => person.personNumber == personNumber,
      orElse: () {
        print('Ошибка: Person с personNumber $personNumber не найден');
        return Person(name: 'Unknown', personNumber: '000000-0000');
      },
    );
    print('Person: ${person.name}, personnummer: ${person.personNumber}');
  }
*/
  Person? getPersonByPersonNumber(String personNumber) {
    for (var person in _personsList) {
      if (person.personNumber == personNumber) {
        print('Person: ${person.name}, personnummer: ${person.personNumber}');
        return person;
      }
    }
    print('Ошибка: Person с personNumber $personNumber не найден');
    return null;
  }

  void updatePerson(Person updatedPerson) {
    final index = _personsList
        .indexWhere((p) => p.personNumber == updatedPerson.personNumber);
    if (index != -1) {
      _personsList[index] = updatedPerson;
      print('Person ${updatedPerson.name} обновлен.');
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
      print('Person с personNumber $personNumber удален.');
    } else {
      print('Ошибка: Person с personNumber $personNumber не найден.');
    }
  }
}
