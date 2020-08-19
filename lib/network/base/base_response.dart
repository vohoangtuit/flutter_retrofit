
import 'package:retrofit_app/network/base/server_errror.dart';

class BaseResponseModel<T> {
  ServerError serverError;
  T data;
  List<T> listData;

  setException(ServerError error) {
    serverError = error;
  }

  setData(T data) {
    this.data = data;
  }
  setListData(List<T> listData){
    this.listData = listData;
  }

  get getServerError {
    return serverError;
  }
}