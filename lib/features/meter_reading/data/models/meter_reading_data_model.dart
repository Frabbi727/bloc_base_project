import 'package:bloc_skeleton_project/features/meter_reading/data/models/shop_meter_reading_model.dart';
import 'package:bloc_skeleton_project/features/meter_reading/domain/entities/meter_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'meter_billing_cycle_model.dart';
part 'meter_reading_data_model.g.dart';
@JsonSerializable(explicitToJson: true)

class MeterReadingDataModel {
  @JsonKey(name: 'billing_month')
  MeterBillingCycleModel? billingMonth;
  List<ShopMeterReadingModel>? readings;

  MeterReadingDataModel({
    this.billingMonth,
    this.readings,
  });

  factory MeterReadingDataModel.fromJson(Map<String, dynamic> json) =>
      _$MeterReadingDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeterReadingDataModelToJson(this);

  MeterData toEntity() {
    return MeterData(
      billingMonth: billingMonth?.toEntity(),
      readings: readings?.map((reading) => reading.toEntity()).toList() ?? [],
    );
  }

  @override
  String toString() {
    return 'MeterReadingDataModel{billingMonth: $billingMonth, readings: $readings}';
  }


}
