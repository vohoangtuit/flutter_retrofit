import 'package:flutter/material.dart';
import 'package:retrofit_app/base/bases_statefulwidget.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/widget/basewidget.dart';

class DetailProduct extends StatefulWidget {
  Product product;
  DetailProduct(this.product);
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends BaseStatefulState<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, 'Detail'),
      body: Container(),

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDetail();
  }
  _getDetail(){
  showLoading(true);
  }
}
