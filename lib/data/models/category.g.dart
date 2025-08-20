// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      rid: (json['rid'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'rid': instance.rid,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'createdAt': instance.createdAt,
    };
