import 'package:flutter/material.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/widget/basewidget.dart';

class DetailProduct extends StatefulWidget {
  Product product;
  DetailProduct(this.product);
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTitle(context, 'Detail'),
      body: Container(),

    );
  }
}
