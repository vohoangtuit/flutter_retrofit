import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/models/user.dart';

part 'restclient.g.dart';
// todo: delete old file restclient.g.dart
// todo: run comment restclient.g.dart =// cd root project : flutter pub run build_runner build
@RestApi(baseUrl: "https://5f34f6e09124200016e19304.mockapi.io/api/v1/")
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/users")
  Future<List<UserModel>> getUsers();

  @GET("/products")
  Future<List<Product>> getProducts();
}