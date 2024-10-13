//import 'dart:io';
import 'Person.dart';

class PersonRepository {
  static final PersonRepository _instance = PersonRepository._internal();
  final List<Person> _persons = [];

  PersonRepository._internal();
  static PersonRepository get instance => _instance;

  void add(Person person) {
    _persons.add(person);
    print('Person ${person.name} added.');
  }

  List<Person> getAll() {
    return _persons;
  }

  Person getById(String personNumber) {
    return _persons.firstWhere(
      (person) => person.personNumber == personNumber,
      orElse: () {
        print(
            'Person med personnummer $personNumber hittades inte, returning default person.');
        return Person.getDefault(); // Возвращаем дефолтного человека
      },
    );
  }

  void update(String personNumber, Person updatedPerson) {
    for (int i = 0; i < _persons.length; i++) {
      if (_persons[i].personNumber == personNumber) {
        _persons[i] = updatedPerson;
        return;
      }
    }
  }

/*   void update(Person updatedPerson) {
    final index = _persons.indexWhere((person) => person.personNumber == updatedPerson.personNumber);
    if (index != -1) {
      _persons[index] = updatedPerson;
      print('Person ${updatedPerson.name} har uppdaterats.');
    } else {
      print('Person med personnummer ${updatedPerson.personNumber} hittades inte.');
    }
  }
*/
  void delete(String personNumber) {
    _persons.removeWhere((person) => person.personNumber == personNumber);
  }
}
