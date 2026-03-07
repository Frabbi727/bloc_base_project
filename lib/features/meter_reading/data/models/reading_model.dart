


import 'package:json_annotation/json_annotation.dart';
part 'reading_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ReadingModel {
  int? shopId;
  String? shopNo;
  String? ownerName;
  String? meterNo;
  int? readingId;
  String? prevReading;
  dynamic currReading;
  dynamic units;
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