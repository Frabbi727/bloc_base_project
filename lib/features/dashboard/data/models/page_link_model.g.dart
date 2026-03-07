// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageLinkModel _$PageLinkModelFromJson(Map<String, dynamic> json) =>
    PageLinkModel(
      url: json['url'] as String?,
      label: json['label'] as String,
      page: (json['page'] as num?)?.toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$PageLinkModelToJson(PageLinkModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'page': instance.page,
      'active': instance.active,
    };
