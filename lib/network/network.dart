import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/models/user.dart';

part 'network.g.dart';

// todo: delete old file network.g.dart
// todo: run comment restclient.g.dart =// cd root project : flutter pub run build_runner build
@RestApi(baseUrl: "https://5f34f6e09124200016e19304.mockapi.io/api/v1/")
abstract class Network {
  factory Network(Dio dio,String token, {String baseUrl}) {
    Map<String, dynamic> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
      'Language': 'vi'
    };
    dio.options = BaseOptions(
        receiveTimeout: 5000,
        connectTimeout: 5000,
       // contentType: 'application/json',
        headers: requestHeaders,

    );

    dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));// // todo: this is log body every request and response
    //final client = Network(dio, baseUrl: "your base url");
    return _Network(dio, baseUrl: baseUrl);
  }

  @GET("/users")
  Future<List<UserModel>> getUsers();

  @GET("/products")
  Future<List<Product>> getProducts();

  @GET("/products/{id}")
  Future<Product> getDetailProduct(@Path("id") String id);
}
