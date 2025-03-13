import 'package:equatable/equatable.dart';

enum VehicleType {
  vehicle1,
  vehicle2,
  vehicle3,
  vehicle4,
  vehicle5,
  vehicle6,
  vehicle7,
}

extension VehicleTypeParsing on VehicleType {
  String get value => name.split('.').last.toUpperCase();
}

class Vehicle extends Equatable {
  final VehicleType type;
  final int key;

  const Vehicle({
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
