import 'package:equatable/equatable.dart';

import 'meter_data.dart';

class MeterReading extends Equatable {
  final bool? success;
  final MeterData? data;

  const MeterReading({
    this.success,
    this.data,
  });

  @override
  List<Object?> get props => [success, data];
}
