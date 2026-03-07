import 'package:equatable/equatable.dart';

class Reading extends Equatable {
  final int? shopId;
  final String? shopNo;
  final String? ownerName;
  final String? meterNo;
  final int? readingId;
  final String? prevReading;
  final dynamic currReading;
  final dynamic units;
  final bool? hasReading;

  const Reading({
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

  @override
  List<Object?> get props => [
        shopId,
        shopNo,
        ownerName,
        meterNo,
        readingId,
        prevReading,
        currReading,
        units,
        hasReading,
      ];
}
