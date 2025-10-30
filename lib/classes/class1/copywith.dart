/*
In this class learn about the copyWith method in Dart classes.
The copyWith method is used to create a new instance of a class
with some properties modified while keeping the rest unchanged.
key Note - It helps in maintaining immutability.
In-Short
•	It creates a new copy of the object.
•	It lets you update only the fields you want.
•	It’s used heavily in immutable state management.
•	Yes, you can think of it as a “copy constructor with optional updates.
*/

void main() {
  Person p1 = Person(name: "Alice", age: 30);
  p1.printDetails();
  Person p2 = p1.copyWith(age: 31);
  p2.printDetails();
}

class Person {
  final String name;
  final int age;
  void printDetails() {
    // ignore: avoid_print
    print('Name: $name, Age: $age');
  }

  Person({required this.name, required this.age});
  Person copyWith({String? name, int? age}) {
    return Person(name: name ?? this.name, age: age ?? this.age);
  }
}
