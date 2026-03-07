
import 'package:json_annotation/json_annotation.dart';
import 'package:bloc_skeleton_project/features/meter_reading/domain/entities/reading.dart';
part 'shop_meter_reading_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ShopMeterReadingModel {
  @JsonKey(name: 'shop_id')
  int? shopId;
  @JsonKey(name: 'shop_no')
  String? shopNo;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'meter_no')
  String? meterNo;
  @JsonKey(name: 'reading_id')
  int? readingId;
  @JsonKey(name: 'prev_reading')
  String? prevReading;
  @JsonKey(name: 'curr_reading')
  dynamic currReading;
  dynamic units;
  @JsonKey(name: 'has_reading')
  bool? hasReading;

  ShopMeterReadingModel({
    this.shopId,
    this.shopNo,
    this.ownerName,
    this.meterNo,
    this.readingId,
    this.prevReading,
    this.currReading,
    this.units,
    this.hasReading,
  });
  factory ShopMeterReadingModel.fromJson(Map<String, dynamic> json) =>
      _$ShopMeterReadingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopMeterReadingModelToJson(this);

  Reading toEntity() {
    return Reading(
      shopId: shopId,
      shopNo: shopNo,
      ownerName: ownerName,
      meterNo: meterNo,
      readingId: readingId,
      prevReading: prevReading,
      currReading: currReading,
      units: units,
      hasReading: hasReading,
    );
  }

  @override
  String toString() {
    return 'ShopMeterReadingModel{shopId: $shopId, shopNo: $shopNo, ownerName: $ownerName, meterNo: $meterNo, readingId: $readingId, prevReading: $prevReading, currReading: $currReading, units: $units, hasReading: $hasReading}';
  }
}
