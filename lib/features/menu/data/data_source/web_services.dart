import 'package:texas/features/menu/data/models/item_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://fakerestaurantapi.runasp.net/api/Restaurant/')
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET('items')
  Future<List<Item>> getAllItems();
}
