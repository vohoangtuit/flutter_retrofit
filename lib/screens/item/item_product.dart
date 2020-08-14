
import 'package:flutter/material.dart';
import 'package:retrofit_app/models/product.dart';
import 'package:retrofit_app/widget/text_style.dart';

class ItemProduct extends StatefulWidget {
  Product product;
  Function onTap;
  ItemProduct(this.product,this.onTap);
  @override
  _ItemUserState createState() => _ItemUserState();
}

class _ItemUserState extends State<ItemProduct> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
      child: InkWell(
        onTap: widget.onTap,
        child:  Container(
           height: 100,
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: widget.product.image.isNotEmpty?Image.network(widget.product.image,width: 90,height: 100,):Image.asset('assets/images/logo.png',width: 90,height: 100,),
                  ),
                  Flexible(
                    child:  Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.product.name,style: textBlueMedium(), overflow: TextOverflow.ellipsis,
                                maxLines: 2,),
                              SizedBox(height: 5,),
                              Text(" "+widget.product.price.toString(),style: normalTextBlack()),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
  }
}