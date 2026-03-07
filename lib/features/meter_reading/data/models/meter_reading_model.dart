
import 'package:bloc_skeleton_project/features/meter_reading/data/models/meter_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meter_reading_model.g.dart';
@JsonSerializable(explicitToJson: true)

class MeterReadingModel {
  bool? success;
  MeterDataModel? data;

  MeterReadingModel({
    this.success,
    this.data,
  });
  factory MeterReadingModel.fromJson(Map<String, dynamic> json) =>
      _$MeterReadingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeterReadingModelToJson(this);

  @override
  String toString() {
    return 'MeterReadingModel{success: $success, data: $data}';
  }


}






