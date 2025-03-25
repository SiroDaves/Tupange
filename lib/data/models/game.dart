import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/utils/constants/db_constants.dart';

part 'game.g.dart';

@Entity(tableName: DbConstants.gamesTable)
@JsonSerializable()
class Game {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? rid;
  int? category;
  String? title;
  String? description;
  String? image;
  String? facts;
  String? createdAt;

  Game({
    this.rid,
    this.category,
    this.title,
    this.description,
    this.image,
    this.facts,
    this.createdAt,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
