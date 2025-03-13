import 'package:equatable/equatable.dart';

enum CountryType {
  country1,
  country2,
  country3,
  country4,
  country5,
  country6,
  country7,
  country8,
  country9,
  country10,
  country11,
  country12,
  country13,
}

extension CountryTypeParsing on CountryType {
  String get value => name.split('.').last.toUpperCase();
}

class Country extends Equatable {
  final CountryType type;
  final int key;

  const Country({
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
