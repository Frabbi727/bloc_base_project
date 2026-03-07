// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponseModel _$DashboardResponseModelFromJson(
  Map<String, dynamic> json,
) => DashboardResponseModel(
  success: json['success'] as bool,
  data: ShopsPageModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DashboardResponseModelToJson(
  DashboardResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
