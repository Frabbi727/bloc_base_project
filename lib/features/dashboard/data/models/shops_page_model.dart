import 'package:json_annotation/json_annotation.dart';
import 'page_link_model.dart';
import 'shop_model.dart';

part 'shops_page_model.g.dart';

@JsonSerializable()
class ShopsPageModel {
  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<ShopModel> data;
  @JsonKey(name: 'first_page_url')
  final String firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int lastPage;
  @JsonKey(name: 'last_page_url')
  final String lastPageUrl;
  final List<PageLinkModel> links;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String path;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  final int? to;
  final int total;

  ShopsPageModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory ShopsPageModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsPageModelToJson(this);
}
