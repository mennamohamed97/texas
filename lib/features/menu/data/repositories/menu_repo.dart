import 'package:texas/core/networking/api_result.dart';
import 'package:texas/core/networking/network_exceptions.dart';
import 'package:texas/features/menu/data/data_source/web_services.dart';
import 'package:texas/features/menu/data/models/item_model.dart';

class MenuRepo {
  final WebServices webService;

  MenuRepo(this.webService);

  Future<ApiResult<List<Item>>> getAllItems() async {
    try {
      final response = await webService.getAllItems();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
