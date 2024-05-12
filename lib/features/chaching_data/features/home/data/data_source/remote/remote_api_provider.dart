import 'package:advanced_flutter/features/chaching_data/config/constants/api_contants.dart';
import 'package:advanced_flutter/features/chaching_data/core/helper/log_helper.dart';
import 'package:dio/dio.dart';

class HomeApiProvider {
  final Dio dio;

  HomeApiProvider(this.dio);

  /// Call Home Page Products Data
  dynamic callHomeProductsEndPoint() async {
    /// request url
    final requestUrl = EnvironmentVariable.getProducts;

    final response = await dio
        .request(
      requestUrl,
      options: Options(method: "GET"),
    )
        .onError((DioException error, stackTrace) {
      logger.e(error.toString());
      throw error;
    });
    return response;
  }
}
