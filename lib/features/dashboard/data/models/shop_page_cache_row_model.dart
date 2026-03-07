import '../../domain/entities/shop_page_cache_row.dart';
import 'shop_model.dart';

class ShopPageCacheRowModel {
  final ShopModel shop;
  final int page;
  final int perPage;
  final int sortOrder;
  final DateTime cachedAt;

  const ShopPageCacheRowModel({
    required this.shop,
    required this.page,
    required this.perPage,
    required this.sortOrder,
    required this.cachedAt,
  });

  ShopPageCacheRow toEntity() {
    return ShopPageCacheRow(
      shop: shop.toEntity(),
      page: page,
      perPage: perPage,
      sortOrder: sortOrder,
      cachedAt: cachedAt,
    );
  }
}
