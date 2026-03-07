import 'package:bloc_skeleton_project/features/meter_reading/data/models/meter_reading_data_model.dart';
import 'package:bloc_skeleton_project/features/meter_reading/domain/entities/meter_reading.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meter_reading_response_model.g.dart';
@JsonSerializable(explicitToJson: true)

class MeterReadingResponseModel {
  bool? success;
  MeterReadingDataModel? data;

  MeterReadingResponseModel({
    this.success,
    this.data,
  });
  factory MeterReadingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MeterReadingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeterReadingResponseModelToJson(this);

  MeterReading toEntity() {
    return MeterReading(
      success: success,
      data: data?.toEntity(),
    );
  }

  @override
  String toString() {
    return 'MeterReadingResponseModel{success: $success, data: $data}';
  }


}




