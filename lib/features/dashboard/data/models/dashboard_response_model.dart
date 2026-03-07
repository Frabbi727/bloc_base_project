import 'package:json_annotation/json_annotation.dart';
import 'shops_page_model.dart';

part 'dashboard_response_model.g.dart';

@JsonSerializable()
class DashboardResponseModel {
  final bool success;
  final ShopsPageModel data;

  DashboardResponseModel({
    required this.success,
    required this.data,
  });

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardResponseModelToJson(this);
}
