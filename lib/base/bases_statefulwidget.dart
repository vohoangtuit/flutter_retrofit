import 'package:flutter/material.dart';
import 'package:retrofit_app/network/rest_client.dart';
import 'package:retrofit_app/widget/loading.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  var restApi = RestClient();
  _BaseStatefulState() {
    // Parent constructor
  }
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
  Widget showLoading(bool show){
    if(show){
      return widgetLoading();
    }
  }

  void baseMethod() {
    // Parent method
  }
}
