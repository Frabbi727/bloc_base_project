import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_skeleton_project/features/meter_reading/domain/entities/billing_month.dart';
part 'meter_billing_cycle_model.g.dart';
@JsonSerializable(explicitToJson: true)

class MeterBillingCycleModel {
  int? id;
  String? name;
  int? month;
  int? year;
  @JsonKey(name: 'start_date')

  DateTime? startDate;
  @JsonKey(name: 'end_date')
  DateTime? endDate;
  String? status;
  dynamic notes;
  @JsonKey(name: 'created_at')

  DateTime? createdAt;
  @JsonKey(name: 'updated_at')

  DateTime? updatedAt;

  MeterBillingCycleModel({
    this.id,
    this.name,
    this.month,
    this.year,
    this.startDate,
    this.endDate,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory MeterBillingCycleModel.fromJson(Map<String, dynamic> json) =>
      _$MeterBillingCycleModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeterBillingCycleModelToJson(this);

  BillingMonth toEntity() {
    return BillingMonth(
      id: id,
      name: name,
      month: month,
      year: year,
      startDate: startDate,
      endDate: endDate,
      status: status,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  String toString() {
    return 'MeterBillingCycleModel{id: $id, name: $name, month: $month, year: $year, startDate: $startDate, endDate: $endDate, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
