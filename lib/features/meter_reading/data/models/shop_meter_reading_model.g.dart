// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_meter_reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopMeterReadingModel _$ShopMeterReadingModelFromJson(
  Map<String, dynamic> json,
) => ShopMeterReadingModel(
  shopId: (json['shop_id'] as num?)?.toInt(),
  shopNo: json['shop_no'] as String?,
  ownerName: json['owner_name'] as String?,
  meterNo: json['meter_no'] as String?,
  readingId: (json['reading_id'] as num?)?.toInt(),
  prevReading: json['prev_reading'] as String?,
  currReading: json['curr_reading'],
  units: json['units'],
  hasReading: json['has_reading'] as bool?,
);

Map<String, dynamic> _$ShopMeterReadingModelToJson(
  ShopMeterReadingModel instance,
) => <String, dynamic>{
  'shop_id': instance.shopId,
  'shop_no': instance.shopNo,
  'owner_name': instance.ownerName,
  'meter_no': instance.meterNo,
  'reading_id': instance.readingId,
  'prev_reading': instance.prevReading,
  'curr_reading': instance.currReading,
  'units': instance.units,
  'has_reading': instance.hasReading,
};
