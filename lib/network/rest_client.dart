import 'package:dio/dio.dart';
import 'package:retrofit_app/base/bases_statefulwidget.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/network/base/base_response.dart';
import 'package:retrofit_app/network/base/server_errror.dart';
import 'package:retrofit_app/network/network.dart';

class RestClient{
  Dio dio;
  Network network;
 final BaseStatefulState baseStatefulState;
  RestClient({this.baseStatefulState}) {
    dio = new Dio();
    network = new Network(dio);
  }

  Future<BaseResponseModel<List<Product>>> getProducts() async {
    List<Product> response;
    showLoading(true);
    try {
      response = await network.getProducts();
      showLoading(false);
    } catch (error, stacktrace) {
      showLoading(false);
     return BaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return BaseResponseModel()..data = response;
  }
  Future<BaseResponseModel<Product>> getDetailProduct(String id) async {
    Product response;
    showLoading(true);
    try {
      response = await network.getDetailProduct(id);
      showLoading(false);
    } catch (error, stacktrace) {
      showLoading(false);
      return BaseResponseModel()..setException(ServerError.withError(error: error));
    }
    return BaseResponseModel()..data = response;
  }

  showLoading(bool show){
    if(show){
      baseStatefulState.showLoading();
    }else{
      baseStatefulState.hideLoading();
    }
  }
}