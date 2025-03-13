import 'package:equatable/equatable.dart';

enum CountyType {
  county1,
  county2,
  county3,
  county4,
  county5,
  county6,
  county7,
  county8,
  county9,
  county10,
  county11,
  county12,
  county13,
  county14,
  county15,
  county16,
  county17,
  county18,
  county19,
}

extension CountyTypeParsing on CountyType {
  String get value => name.split('.').last.toUpperCase();
}

class County extends Equatable {
  final CountyType type;
  final int key;

  const County({
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
