import 'file:///C:/TU/Develop/Demo/flutter_retrofit/lib/network/base/server_errror.dart';

class BaseResponseModel<T> {
  ServerError _error;
  T data;
  List<T> listData;

  setException(ServerError error) {
    _error = error;
  }

  setData(T data) {
    this.data = data;
  }
  setListData(List<T> listData){
    this.listData = listData;
  }

  get getException {
    return _error;
  }
}