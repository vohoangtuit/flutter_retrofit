import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/network/base/base_response.dart';
import 'package:retrofit_app/network/base/server_errror.dart';
import 'package:retrofit_app/network/network.dart';

class RestClient{

  Dio dio;
  Network network;
//  final Function(String message) errorMessage;
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
      //error =ServerError().getError(error).toString();
     // BaseResponseModel baseResponseModel =BaseResponseModel()..setException(ServerError.withError(error: error));
      String errors =ServerError().getError(error);

      //errorMessage(errors);
     // return BaseResponseModel()..setException(ServerError.withError(error: error));
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