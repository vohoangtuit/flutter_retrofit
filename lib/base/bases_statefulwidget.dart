import 'package:flutter/material.dart';
import 'package:retrofit_app/network/rest_client.dart';
import 'package:retrofit_app/widget/loading.dart';
import 'package:retrofit_app/widget/loadingdialog.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  var restApi = RestClient();
   bool isLoading =false;
   LoadingDialog loadingDialog;

//  _BaseStatefulState() {
//
//  }
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
    // TODO: implement initState
    super.initState();
  }

  void baseMethod() {
    // Parent method
  }
  showMaterialDialog(String title, String message) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
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
