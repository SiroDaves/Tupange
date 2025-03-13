import 'package:equatable/equatable.dart';

enum PresidentType {
  president1,
  president2,
  president3,
  president4,
  president5,
  president6,
  president7,
  president8,
  president9,
  president10,
  president11,
  president12,
  president13,
  president14,
}

extension PresidentTypeParsing on PresidentType {
  String get value => name.split('.').last.toUpperCase();
}

class President extends Equatable {
  final PresidentType type;
  final int key;

  const President({
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
