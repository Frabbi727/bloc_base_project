// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeterReadingResponseModel _$MeterReadingResponseModelFromJson(
  Map<String, dynamic> json,
) => MeterReadingResponseModel(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : MeterReadingDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MeterReadingResponseModelToJson(
  MeterReadingResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data?.toJson(),
};
