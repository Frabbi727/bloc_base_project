import 'package:equatable/equatable.dart';

import 'shop.dart';

class ShopPageCacheRow extends Equatable {
  final Shop shop;
  final int page;
  final int perPage;
  final int sortOrder;
  final DateTime cachedAt;

  const ShopPageCacheRow({
    required this.shop,
    required this.page,
    required this.perPage,
    required this.sortOrder,
    required this.cachedAt,
  });

  @override
  List<Object?> get props => [shop, page, perPage, sortOrder, cachedAt];
}
