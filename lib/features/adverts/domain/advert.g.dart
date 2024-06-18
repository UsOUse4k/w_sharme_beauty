// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeImpl _$$TimeImplFromJson(Map json) => _$TimeImpl(
      day: $enumDecode(_$WeekdayEnumMap, json['day']),
      from: json['from'] as String,
      to: json['to'] as String,
    );

Map<String, dynamic> _$$TimeImplToJson(_$TimeImpl instance) =>
    <String, dynamic>{
      'day': _$WeekdayEnumMap[instance.day]!,
      'from': instance.from,
      'to': instance.to,
    };

const _$WeekdayEnumMap = {
  Weekday.monday: 'monday',
  Weekday.tuesday: 'tuesday',
  Weekday.wednesday: 'wednesday',
  Weekday.thursday: 'thursday',
  Weekday.friday: 'friday',
  Weekday.saturday: 'saturday',
  Weekday.sunday: 'sunday',
};

_$ServiceImpl _$$ServiceImplFromJson(Map json) => _$ServiceImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
    };
