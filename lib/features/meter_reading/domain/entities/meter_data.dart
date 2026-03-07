import 'package:equatable/equatable.dart';

import 'billing_month.dart';
import 'reading.dart';

class MeterData extends Equatable {
  final BillingMonth? billingMonth;
  final List<Reading> readings;

  const MeterData({
    this.billingMonth,
    this.readings = const [],
  });

  @override
  List<Object?> get props => [billingMonth, readings];
}
