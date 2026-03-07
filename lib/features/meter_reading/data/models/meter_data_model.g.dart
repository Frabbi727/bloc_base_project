// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeterDataModel _$MeterDataModelFromJson(Map<String, dynamic> json) =>
    MeterDataModel(
      billingMonth: json['billingMonth'] == null
          ? null
          : BillingMonthModel.fromJson(
              json['billingMonth'] as Map<String, dynamic>,
            ),
      readings: (json['readings'] as List<dynamic>?)
          ?.map((e) => ReadingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeterDataModelToJson(MeterDataModel instance) =>
    <String, dynamic>{
      'billingMonth': instance.billingMonth?.toJson(),
      'readings': instance.readings?.map((e) => e.toJson()).toList(),
    };
