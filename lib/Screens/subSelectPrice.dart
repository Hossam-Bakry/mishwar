import 'package:flutter/material.dart';
import 'package:mishwar/Model/CartModelLocal.dart';
import 'package:mishwar/Model/ProductModel.dart';
import 'package:mishwar/Screens/slmlmProvider.dart';
import 'package:provider/provider.dart';

import '../dbHelper.dart';

class SubSelectPrice extends StatefulWidget {
  final SubProductDetail1 subProduct;

  SubSelectPrice({Key key, this.subProduct}) : super(key: key);

  @override
  _SubSelectPriceState createState() => _SubSelectPriceState();
}

class _SubSelectPriceState extends State<SubSelectPrice> {
  DbHelper dbHelper = new DbHelper();
  List dataLocal = [];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              // Provider.of<SlmlmProvider>(context, listen: false)
              //     .selectTypePrice(
              //   subProductParm: widget.subProduct,
              // );
              //
              // CartMedelLocal p1 = new CartMedelLocal({
              //   "id": int.parse(widget.subProduct.id),
              //   "name": widget.subProduct.name,
              //   "img": widget.subProduct.image,
              //   "description": widget.subProduct.description,
              //   "price": double.parse(widget.subProduct.price),
              //   "offerPrice": Provider.of<SlmlmProvider>(context, listen: false)
              //       .totalPriceOffer,
              //   "price2": double.parse(widget.subProduct.price2),
              //   "totalPrice": double.parse(
              //       Provider.of<SlmlmProvider>(context, listen: false)
              //           .subProduct
              //           .price2),
              //   "quantity": 1,
              //   "selectedTypeName": 'subItem',
              //   "offerName": Provider.of<SlmlmProvider>(context, listen: false)
              //       .totalofferNames,
              //   'message': '',
              // });
              //
              // if (isChecked == false) {
              //   setState(() {
              //     isChecked = true;
              //   });
              //   await dbHelper.addToCart(p1);
              // } else {
              //   setState(() {
              //     isChecked = false;
              //   });
              //   loadData();
              //   setState(() {
              //     dbHelper.delete(int.parse(widget.subProduct.id));
              //   });
              // }
              // print(
              //     'leee => ${Provider.of<SlmlmProvider>(context, listen: false).subItemsList.length}');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.subProduct.name,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Text(
                        "${widget.subProduct.price2} ريال ",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Consumer<SlmlmProvider>(
                  builder: (context, ch, _) => Checkbox(
                    value: isChecked,
                    onChanged: (bool value) async{

                      Provider.of<SlmlmProvider>(context, listen: false)
                          .selectTypePrice(subProductParm: widget.subProduct);

                      CartMedelLocal p1 = new CartMedelLocal({
                        "id": int.parse(widget.subProduct.id),
                        "name": widget.subProduct.name,
                        "img": widget.subProduct.image,
                        "description": widget.subProduct.description,
                        "price": double.parse(widget.subProduct.price),
                        "offerPrice": Provider.of<SlmlmProvider>(context, listen: false)
                            .totalPriceOffer,
                        "price2": double.parse(widget.subProduct.price2),
                        "totalPrice": double.parse(
                            Provider.of<SlmlmProvider>(context, listen: false)
                                .subProduct
                                .price2),
                        "quantity": 1,
                        "selectedTypeName": 'subItem',
                        "offerName": Provider.of<SlmlmProvider>(context, listen: false).totalofferNames,
                        'message': '',
                      });
                      setState(() {
                        isChecked = value;
                      });

                      if (isChecked) {

                        await dbHelper.addToCart(p1);
                      } else {

                        loadData();
                        setState(() {
                          dbHelper.delete(int.parse(widget.subProduct.id));
                        });
                      }
                      print(
                          'leee => ${Provider.of<SlmlmProvider>(context, listen: false).subItemsList.length}');
                    },
                    activeColor: Color(0xffD4252F),
                  ),
                ),
                // Consumer<SlmlmProvider>(
                //   builder: (context, ch, _) => Radio(
                //     value: widget.subProduct,
                //     groupValue: ch.subProduct,
                //     onChanged: (val) {
                //       print(val);
                //       ch.selectTypePrice(subProductParm: val);
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          )
        ],
      ),
    );
  }

  loadData() async {
    dataLocal = await dbHelper.allProduct();
    setState(() {});
  }
}
