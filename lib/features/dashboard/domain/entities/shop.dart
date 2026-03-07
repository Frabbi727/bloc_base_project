import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final int id;
  final String shopNo;
  final String ownerName;
  final String? ownerNid;
  final String? ownerPhone;
  final int? sqft;
  final String? meterNo;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const Shop({
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

  @override
  List<Object?> get props => [
        id,
        shopNo,
        ownerName,
        ownerNid,
        ownerPhone,
        sqft,
        meterNo,
        isActive,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
