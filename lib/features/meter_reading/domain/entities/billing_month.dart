import 'package:equatable/equatable.dart';

class BillingMonth extends Equatable {
  final int? id;
  final String? name;
  final int? month;
  final int? year;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? status;
  final dynamic notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const BillingMonth({
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

  @override
  List<Object?> get props => [
        id,
        name,
        month,
        year,
        startDate,
        endDate,
        status,
        notes,
        createdAt,
        updatedAt,
      ];
}
