// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_billing_month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingMonthModel _$BillingMonthModelFromJson(Map<String, dynamic> json) =>
    BillingMonthModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      status: json['status'] as String?,
      notes: json['notes'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BillingMonthModelToJson(BillingMonthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'month': instance.month,
      'year': instance.year,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'status': instance.status,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
