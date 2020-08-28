
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_app/base/bases_statefulwidget.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/widget/basewidget.dart';

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

        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _getData();
    });

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
    var result =await restApi.getProducts();
    if(result!=null&&result.data!=null){
      setState(() {
        list=result.data ;
      });
    }
    else{
      print("no data-----------------------");
    }
  }
}
