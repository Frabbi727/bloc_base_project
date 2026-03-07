// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingModel _$ReadingModelFromJson(Map<String, dynamic> json) => ReadingModel(
  shopId: (json['shopId'] as num?)?.toInt(),
  shopNo: json['shopNo'] as String?,
  ownerName: json['ownerName'] as String?,
  meterNo: json['meterNo'] as String?,
  readingId: (json['readingId'] as num?)?.toInt(),
  prevReading: json['prevReading'] as String?,
  currReading: json['currReading'],
  units: json['units'],
  hasReading: json['hasReading'] as bool?,
);

Map<String, dynamic> _$ReadingModelToJson(ReadingModel instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'shopNo': instance.shopNo,
      'ownerName': instance.ownerName,
      'meterNo': instance.meterNo,
      'readingId': instance.readingId,
      'prevReading': instance.prevReading,
      'currReading': instance.currReading,
      'units': instance.units,
      'hasReading': instance.hasReading,
    };
