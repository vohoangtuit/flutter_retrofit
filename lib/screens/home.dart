
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_app/models/product.dart';
import 'file:///C:/TU/Develop/Demo/flutter_retrofit/lib/network/base/base_response.dart';
import 'package:retrofit_app/network/rest_client.dart';
import 'package:retrofit_app/network/network.dart';
import 'package:retrofit_app/widget/basewidget.dart';
import 'package:retrofit_app/widget/loading.dart';

import 'detail_product.dart';
import 'item/item_product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var restApi = RestClient();
  List<Product> list = List<Product>();
  bool _isLoading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, 'Home'),
      body: Stack(
        children: <Widget>[
          initListView(),
          Center(
            child: _isLoading ? widgetLoading() : null,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }
  ListView initListView(){
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,height: 1,
      ),
      itemCount: list!=null?list.length:0,
      itemBuilder: (context,index){
        return ItemProduct(list[index],(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailProduct(list[index])));
        });
      },
    );
  }
  _getData()async{
    setState(() {
      _isLoading =true;
    });
    var result =await restApi.getProducts();
    if(result!=null){
      setState(() {
        _isLoading =false;
        list=result.data ;
      //  print(" list "+list.toString());
      });
    }else{
      print("no data-----------------------");
    }
  }
}
