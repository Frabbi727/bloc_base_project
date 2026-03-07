import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../models/dashboard_response_model.dart';
import '../models/shops_page_model.dart';

abstract class DashboardRemoteDataSource {
  Future<ShopsPageModel> getShops({int page = 1, int perPage = 10});
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final DioClient dioClient;

  DashboardRemoteDataSourceImpl(this.dioClient);

  @override
  Future<ShopsPageModel> getShops({int page = 1, int perPage = 10}) async {
    final response = await dioClient.get<Map<String, dynamic>>(
      ApiConstants.shops,
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );

    final data = response.data;
    if (data == null) {
      throw ServerException('Invalid response');
    }

    final parsed = DashboardResponseModel.fromJson(data);
    return parsed.data;
  }
}
