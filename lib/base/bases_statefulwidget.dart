import 'package:flutter/material.dart';
import 'package:retrofit_app/base/dialog.dart';
import 'package:retrofit_app/network/rest_client.dart';
import 'package:retrofit_app/utils/shared_preference.dart';
import 'package:retrofit_app/widget/progressbar.dart';

typedef Int2VoidFunc = void Function(String);
abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  BaseDialog  dialog;
 static BaseStatefulState baseStatefulState;
  var  restApi;
  ProgressBar progressBar;
  bool onStart =false;
  String token="hello";
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(

        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    progressBar= new ProgressBar();
    baseStatefulState=this;
    _getToken();
    restApi =  RestClient(baseStatefulState:baseStatefulState,token:token);
  }
  @override
  void dispose() {
    progressBar.hide();
    super.dispose();
  }
  _getToken()async{
    // todo: save token to SharedPre or database local after login, and get it
   await SharedPre.getStringKey(SharedPre.sharedPreToken).then((value){
     if(value?.isEmpty ?? true){
       return;
     }else{
       if(mounted){
         setState(() {
           token =value;
         });
       }
     }
    });
  }
  void showLoading() {
    progressBar.show(context);
  }

  void hideLoading() {
    progressBar.hide();
  }

  void baseMethod() {
    // Parent method
  }
  showBaseDialog(String title,String description){
    if(dialog!=null){
      dialog.dismiss();
    }
    dialog = new BaseDialog(title: title, description: description);
    showDialog(
     // barrierDismissible: false,// touch outside dismiss
      context: context,
      builder: (BuildContext context) => dialog
    );
  }

}
