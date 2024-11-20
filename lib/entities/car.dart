import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final String brand;
  final String model;
  final int year;

  const Car({
    required this.brand,
    required this.model,
    required this.year,
  });

  @override
  List<Object?> get props => [brand, model, year];

  @override
  bool get stringify => true;
}
