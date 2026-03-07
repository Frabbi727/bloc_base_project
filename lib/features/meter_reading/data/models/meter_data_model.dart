import 'package:bloc_skeleton_project/features/meter_reading/data/models/reading_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'meter_billing_month_model.dart';
part 'meter_data_model.g.dart';
@JsonSerializable(explicitToJson: true)

class MeterDataModel {
  BillingMonthModel? billingMonth;
  List<ReadingModel>? readings;

  MeterDataModel({
    this.billingMonth,
    this.readings,
  });

  factory MeterDataModel.fromJson(Map<String, dynamic> json) =>
      _$MeterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeterDataModelToJson(this);

  @override
  String toString() {
    return 'MeterDataModel{billingMonth: $billingMonth, readings: $readings}';
  }


}