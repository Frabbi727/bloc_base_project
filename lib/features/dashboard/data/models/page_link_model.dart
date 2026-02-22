import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/page_link.dart';

part 'page_link_model.g.dart';

@JsonSerializable()
class PageLinkModel {
  final String? url;
  final String label;
  final int? page;
  final bool active;

  PageLinkModel({
    required this.url,
    required this.label,
    required this.page,
    required this.active,
  });

  factory PageLinkModel.fromJson(Map<String, dynamic> json) =>
      _$PageLinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageLinkModelToJson(this);

  PageLink toEntity() {
    return PageLink(
      url: url,
      label: label,
      page: page,
      active: active,
    );
  }
}
