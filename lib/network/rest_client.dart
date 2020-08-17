import 'package:dio/dio.dart';
import 'package:retrofit_app/models/product.dart';
import 'file:///C:/TU/Develop/Demo/flutter_retrofit/lib/network/base/base_response.dart';
import 'package:retrofit_app/network/network.dart';
import 'file:///C:/TU/Develop/Demo/flutter_retrofit/lib/network/base/server_errror.dart';

class RestClient{
  Dio dio;
  Network network;
  RestClient() {
    dio = new Dio();
    network = new Network(dio);
  }
  Future<BaseResponseModel<List<Product>>> getProducts() async {
    List<Product> response;
    try {
      response = await network.getProducts();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return BaseResponseModel()..data = response;
  }
  Future<BaseResponseModel<Product>> getDetailProduct(String id) async {
    Product response;
    try {
      response = await network.getDetailProduct(id);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return BaseResponseModel()..data = response;
  }
}