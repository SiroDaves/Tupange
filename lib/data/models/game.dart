import 'package:equatable/equatable.dart';

enum GameType { animals, counties, countries, planets, presidents, vehicles }

extension GameTypeParsing on GameType {
  String get value => name.split('.').last.toUpperCase();
}

class Game extends Equatable {
  final GameType type;
  final int key;
  final String image;

  const Game({
    required this.key,
    required this.type,
    required this.image,
  });

  String get name => type.name;

  @override
  List<Object?> get props => [type, key, image];

  @override
  String toString() {
    return type.toString().toUpperCase();
  }
}
