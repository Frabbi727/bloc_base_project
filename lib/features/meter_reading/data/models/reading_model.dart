


import 'package:json_annotation/json_annotation.dart';
part 'reading_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ReadingModel {
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

  ReadingModel({
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
  factory ReadingModel.fromJson(Map<String, dynamic> json) =>
      _$ReadingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModelToJson(this);

  @override
  String toString() {
    return 'ReadingModel{shopId: $shopId, shopNo: $shopNo, ownerName: $ownerName, meterNo: $meterNo, readingId: $readingId, prevReading: $prevReading, currReading: $currReading, units: $units, hasReading: $hasReading}';
  }
}