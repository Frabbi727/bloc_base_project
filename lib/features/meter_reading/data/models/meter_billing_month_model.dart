import 'package:freezed_annotation/freezed_annotation.dart';
part 'meter_billing_month_model.g.dart';
@JsonSerializable(explicitToJson: true)

class BillingMonthModel {
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

  BillingMonthModel({
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

  factory BillingMonthModel.fromJson(Map<String, dynamic> json) =>
      _$BillingMonthModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillingMonthModelToJson(this);

  @override
  String toString() {
    return 'BillingMonthModel{id: $id, name: $name, month: $month, year: $year, startDate: $startDate, endDate: $endDate, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}