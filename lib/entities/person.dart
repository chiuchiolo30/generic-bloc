import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final int age;
  final String email;

  const Person({
    required this.name,
    required this.age,
    required this.email,
  });

  @override
  List<Object?> get props => [name, age, email];

  @override
  bool get stringify => true;
}
