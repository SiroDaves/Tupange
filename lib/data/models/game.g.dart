// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      rid: (json['rid'] as num?)?.toInt(),
      category: (json['category'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      facts: json['facts'] as String?,
      createdAt: json['createdAt'] as String?,
    )..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'rid': instance.rid,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'facts': instance.facts,
      'createdAt': instance.createdAt,
    };
