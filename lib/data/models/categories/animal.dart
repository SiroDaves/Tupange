import 'package:equatable/equatable.dart';

enum AnimalType {
  animal1,
  animal2,
  animal3,
  animal4,
  animal5,
  animal6,
  animal7,
  animal8,
  animal9,
  animal10,
  animal11,
  animal12,
}

extension AnimalTypeParsing on AnimalType {
  String get value => name.split('.').last.toUpperCase();
}

class Animal extends Equatable {
  final AnimalType type;
  final int key;

  const Animal({
    required this.key,
    required this.type,
  });

  String get name => type.name;

  @override
  List<Object?> get props => [type, key];

  @override
  String toString() {
    return type.toString().toUpperCase();
  }
}
