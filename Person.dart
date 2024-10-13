class Person {
  String name;
  String personNumber;

  Person(this.name, this.personNumber);

  static Person getDefault() {
    return Person('Unknown', '000000-0000');
  }

  @override
  String toString() => 'Person: $name, ID: $personNumber';
}
