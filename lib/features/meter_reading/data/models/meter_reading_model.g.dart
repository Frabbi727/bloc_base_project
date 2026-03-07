// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeterReadingModel _$MeterReadingModelFromJson(Map<String, dynamic> json) =>
    MeterReadingModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : MeterDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeterReadingModelToJson(MeterReadingModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.toJson(),
    };
