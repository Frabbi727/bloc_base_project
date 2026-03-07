// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeterReadingDataModel _$MeterReadingDataModelFromJson(
  Map<String, dynamic> json,
) => MeterReadingDataModel(
  billingMonth: json['billing_month'] == null
      ? null
      : MeterBillingCycleModel.fromJson(
          json['billing_month'] as Map<String, dynamic>,
        ),
  readings: (json['readings'] as List<dynamic>?)
      ?.map((e) => ShopMeterReadingModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MeterReadingDataModelToJson(
  MeterReadingDataModel instance,
) => <String, dynamic>{
  'billing_month': instance.billingMonth?.toJson(),
  'readings': instance.readings?.map((e) => e.toJson()).toList(),
};
