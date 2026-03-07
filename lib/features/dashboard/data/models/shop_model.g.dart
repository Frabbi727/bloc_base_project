// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
  id: (json['id'] as num).toInt(),
  shopNo: json['shop_no'] as String,
  ownerName: json['owner_name'] as String,
  ownerNid: ShopModel._stringOrNull(json['owner_nid']),
  ownerPhone: ShopModel._stringOrNull(json['owner_phone']),
  sqft: (json['sqft'] as num?)?.toInt(),
  meterNo: json['meter_no'] as String?,
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  deletedAt: json['deleted_at'] as String?,
);

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
  'id': instance.id,
  'shop_no': instance.shopNo,
  'owner_name': instance.ownerName,
  'owner_nid': instance.ownerNid,
  'owner_phone': instance.ownerPhone,
  'sqft': instance.sqft,
  'meter_no': instance.meterNo,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
};
