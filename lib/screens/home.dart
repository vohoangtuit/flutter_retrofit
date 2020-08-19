
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_app/base/bases_statefulwidget.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/widget/basewidget.dart';
import 'package:retrofit_app/widget/loading.dart';

import 'detail_product.dart';
import 'item/item_product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulState<HomeScreen> {
  List<Product> list = List<Product>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, 'Home'),
      body: Stack(
        children: <Widget>[
          initListView(),
          Center(
            child: isLoading ? widgetLoading() : null,
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
      isLoading =true;
    });
    var result =await restApi.getProducts();
    if(result!=null){
      setState(() {
        isLoading =false;
        list=result.data ;
      //  print(" list "+list.toString());
      });
    }
    else{
      setState(() {
        isLoading =false;
      });
      print("no data-----------------------");
    }
  }
}
