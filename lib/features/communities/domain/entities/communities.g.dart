// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunitiesImpl _$$CommunitiesImplFromJson(Map<String, dynamic> json) =>
    _$CommunitiesImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$CommunitiesImplToJson(_$CommunitiesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };
