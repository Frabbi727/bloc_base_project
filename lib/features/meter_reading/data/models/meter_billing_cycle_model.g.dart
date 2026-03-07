// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_billing_cycle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeterBillingCycleModel _$MeterBillingCycleModelFromJson(
  Map<String, dynamic> json,
) => MeterBillingCycleModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  month: (json['month'] as num?)?.toInt(),
  year: (json['year'] as num?)?.toInt(),
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
  endDate: json['end_date'] == null
      ? null
      : DateTime.parse(json['end_date'] as String),
  status: json['status'] as String?,
  notes: json['notes'],
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MeterBillingCycleModelToJson(
  MeterBillingCycleModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'month': instance.month,
  'year': instance.year,
  'start_date': instance.startDate?.toIso8601String(),
  'end_date': instance.endDate?.toIso8601String(),
  'status': instance.status,
  'notes': instance.notes,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
