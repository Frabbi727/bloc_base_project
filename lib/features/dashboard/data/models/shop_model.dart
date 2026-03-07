import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/shop.dart';

part 'shop_model.g.dart';

@JsonSerializable()
class ShopModel {
  final int id;
  @JsonKey(name: 'shop_no')
  final String shopNo;
  @JsonKey(name: 'owner_name')
  final String ownerName;
  @JsonKey(name: 'owner_nid', fromJson: _stringOrNull)
  final String? ownerNid;
  @JsonKey(name: 'owner_phone', fromJson: _stringOrNull)
  final String? ownerPhone;
  final int? sqft;
  @JsonKey(name: 'meter_no')
  final String? meterNo;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  ShopModel({
    required this.id,
    required this.shopNo,
    required this.ownerName,
    this.ownerNid,
    this.ownerPhone,
    this.sqft,
    this.meterNo,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopModelToJson(this);

  static String? _stringOrNull(dynamic value) => value?.toString();

  Shop toEntity() {
    return Shop(
      id: id,
      shopNo: shopNo,
      ownerName: ownerName,
      ownerNid: ownerNid,
      ownerPhone: ownerPhone,
      sqft: sqft,
      meterNo: meterNo,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
