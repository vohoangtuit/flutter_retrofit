import 'package:flutter/material.dart';
import 'package:retrofit_app/base/dialog.dart';
import 'package:retrofit_app/network/rest_client.dart';
import 'package:retrofit_app/widget/loading.dart';
import 'package:retrofit_app/widget/loadingdialog.dart';

typedef Int2VoidFunc = void Function(String);
abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  bool isLoading =false;
  LoadingDialog loadingDialog;
  BaseDialog  dialog;
 static BaseStatefulState baseStatefulState;
  var  restApi;
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          child: isLoading?widgetLoading():Container() ,
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    baseStatefulState=this;
    restApi =  RestClient(baseStatefulState:baseStatefulState);
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

  void showLoading(bool show)async{
    await new Future.delayed(new Duration(milliseconds: 30));
    setState(() async{
      if(show){
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) =>
            loadingDialog = loadingDialog ?? LoadingDialog());
      }else{
        if (loadingDialog != null && loadingDialog.isShowing()) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          loadingDialog = null;
        }
      }
    });

  }

}
