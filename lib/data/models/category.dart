import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/utils/constants/db_constants.dart';

part 'category.g.dart';

@Entity(tableName: DbConstants.categoriesTable)
@JsonSerializable()
class Category {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? rid;
  String? title;
  String? description;
  String? image;
  String createdAt;

  Category({
    this.id,
    this.rid,
    this.title,
    this.description,
    this.image,
    String? createdAt,
  })  : createdAt = createdAt ?? DateTime.now().toIso8601String();

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    int? id,
    int? rid,
    String? title,
    String? description,
    String? image,
    String? createdAt,
  }) {
    return Category(
      id: id ?? this.id,
      rid: rid ?? this.rid,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
