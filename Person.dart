class Person {
  Person({required this.name, required this.personNumber});

  String name;
  String personNumber;

  // Serialisering: Konvertera ett objekt till JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'personNumber': personNumber,
    };
  }

  // Deserialisering: Skapa ett objekt från JSON
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'] as String,
      personNumber: json['personNumber'] as String,
    );
  }
}
