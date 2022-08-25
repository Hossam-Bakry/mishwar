import 'package:flutter/material.dart';
import 'package:mishwar/Model/CartModelLocal.dart';
import 'package:mishwar/Model/PromotionItemsModel.dart';
import 'package:mishwar/Screens/slmlmProvider.dart';
import 'package:mishwar/Screens/subofferItempromotion.dart';
import 'package:mishwar/app/Services/ProductServices.dart';
import 'package:mishwar/lang/app_Localization.dart';
import 'package:mishwar/main.dart';
import 'package:provider/provider.dart';

import '../dbHelper.dart';

class Offers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}

class _state extends State<Offers> {
  home h = new home();
  List<Message> promosList = [];
  ProductServices productServices = ProductServices();
  Future<List<Message>> promotionList;
  List<SubItems> subProduct = [];
  String noteMessage = '';
  DbHelper dbHelper = new DbHelper();

  loadData() async {
    promosList = await productServices.GetAllPromosUpdate();
    setState(() {});
  }

  bool isInit = true;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      await loadData();
      setState(() {
        isInit = false;
      });
    }
    ;

    super.didChangeDependencies();
  }

  // List <String>images=["images/food.png","images/product1.png","images/product2.png","images/product3.png","images/product4.png",
  //   "images/product5.png","images/product6.png","images/cart.png"];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/mainPage", (route) => false);
      },
      child: isInit
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Color(h.mainColor),
              ),
            )
          : promosList == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color(h.mainColor),
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .02,
                    left: MediaQuery.of(context).size.width * .05,
                    right: MediaQuery.of(context).size.width * .05,
                    bottom: MediaQuery.of(context).size.height * .02,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: promosList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: MediaQuery.of(context).size.width * .05,
                    crossAxisSpacing: MediaQuery.of(context).size.width * .05,
                    childAspectRatio: 1 / 1.15,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ProductDetails2(
                          promosList.elementAt(index),
                          promosList.elementAt(index).subItems,
                        );
                      },
                      child: Container(
                        // height: MediaQuery.of(context).size.height * .4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .14,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                ),
                                child: promosList.elementAt(index).image != null
                                    ? Image.network(
                                        promosList.elementAt(index).image,
                                        fit: BoxFit.fill,
                                      )
                                    : FadeInImage.assetNetwork(
                                        placeholder: 'images/Spinner.gif',
                                        image:
                                            promosList.elementAt(index).image,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .08,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    promosList.elementAt(index).name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(h.mainColor),
                                      fontSize: 12,
                                      height: 1.2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${promosList.elementAt(index).price2} ' +
                                        DemoLocalizations.of(context)
                                            .title['currency'],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );

    /*Expanded(
     child: Container(
       margin: EdgeInsets.zero,
       color: Colors.white,
       width: MediaQuery.of(context).size.width,
       padding: EdgeInsets.only(
         right: MediaQuery.of(context).size.width*.03,
         left: MediaQuery.of(context).size.width*.03,
       ),

       child:  images.length>0?GridView.builder(
         primary: false,
         padding: EdgeInsets.only(bottom: 50),
         shrinkWrap: true,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 10,
             crossAxisSpacing: 10,
             childAspectRatio: 1/1
         ),
         itemBuilder: (context,index){
           return ClipRRect(
             borderRadius: BorderRadius.all(Radius.circular(10)),
             child: InkWell(
                 child:Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(15)),
                       border: Border.all(color: Color(h.mainColor),width: 2)
                   ),
                   child: ClipRRect(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     child: Image.asset(images[index],
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 onTap: (){
                 }


             ),
           );
         },
         itemCount:images.length,

       ):Center(child: CircularProgressIndicator(),),
     ),
   )*/
  }

  Widget ProductDetails2(Message product, List<SubItems> data) {
    print(data.length);
    print("dddddddddddddddddddddd");
    Provider.of<SlmlmProvider>(context, listen: false).clear();

    Provider.of<SlmlmProvider>(context, listen: false).a7a(
      quantityParm: 1,
      quantityOfferParm: 0,
    );
    int quantity = Provider.of<SlmlmProvider>(context, listen: false).quantity,
        quantityOffer =
            Provider.of<SlmlmProvider>(context, listen: false).quantityOffer;
    print(
        '55555=${Provider.of<SlmlmProvider>(context, listen: false).quantity}');
    double totalPrice = double.parse(product.price2) * quantity;

    double totalPriceOffer = 0.0;
    showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              /*   borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20)
                                          ),*/
                              child: FadeInImage.assetNetwork(
                                placeholder: "images/no-img.jpg",
                                image:
                                    product.image == null ? "" : product.image,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * .32,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                right: 15,
                                top: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(1000)),
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.clear,
                                      size: 20,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .05,
                              right: MediaQuery.of(context).size.width * .05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .025,
                              ),
                              Text(
                                product.name,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .005,
                              ),
                              Text(
                                product.description ?? '',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .015,
                              ),
                              SubOfferItemPromotion(
                                totalPrice: totalPrice,
                                quantity: quantity,
                                product: product,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .025,
                              ),
                              //
                              // Text(
                              //   DemoLocalizations.of(context)
                              //       .title['Choosetherighttype'],
                              //   style: TextStyle(
                              //     fontSize: 14,
                              //     fontWeight: FontWeight.bold,
                              //     color: Color(h.blueColor),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height:
                              //       MediaQuery.of(context).size.height * .015,
                              // ),
                              // Container(
                              //   width: MediaQuery.of(context).size.width,
                              //   // padding:EdgeInsets.only(top:5,bottom:5),
                              //   padding: EdgeInsets.only(right: 10, left: 10.0),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     border: Border.all(
                              //         color: Colors.black12, width: 1),
                              //     color: Colors.white,
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.grey.withOpacity(.1),
                              //         spreadRadius: 3,
                              //         blurRadius: 3,
                              //         offset: Offset(
                              //             0, 3), // changes position of shadow
                              //       ),
                              //     ],
                              //   ),
                              //   margin: EdgeInsets.only(
                              //       //left:MediaQuery.of(context).size.width*.05,
                              //       //right: MediaQuery.of(context).size.width*.05,
                              //       ),
                              //   child: ListView.builder(
                              //       itemCount: data.length,
                              //       primary: false,
                              //       shrinkWrap: true,
                              //       itemBuilder: (context, index) {
                              //         return SubSelectPrice(
                              //           subProduct: data[index],
                              //         );
                              //       }),
                              // ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .015,
                              ),
                              // if (product.offerItems.isNotEmpty)
                              //   Text(
                              //     'العروض',
                              //     style: TextStyle(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.bold,
                              //       color: Color(h.blueColor),
                              //     ),
                              //   ),
                              // if (product.offerItems.isNotEmpty)
                              //   Container(
                              //     width: MediaQuery.of(context).size.width,
                              //     // padding:EdgeInsets.only(top:5,bottom:5),
                              //     padding:
                              //         EdgeInsets.only(right: 10, left: 10.0),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       border: Border.all(
                              //           color: Colors.black12, width: 1),
                              //       color: Colors.white,
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Colors.grey.withOpacity(.1),
                              //           spreadRadius: 3,
                              //           blurRadius: 3,
                              //           offset: Offset(
                              //               0, 3), // changes position of shadow
                              //         ),
                              //       ],
                              //     ),
                              //     margin: EdgeInsets.only(
                              //         //left:MediaQuery.of(context).size.width*.05,
                              //         //right: MediaQuery.of(context).size.width*.05,
                              //         ),
                              //     child: ListView.builder(
                              //       itemCount: product.offerItems.length,
                              //       primary: false,
                              //       shrinkWrap: true,
                              //       itemBuilder: (context, index) {
                              //         return Column(
                              //           children: [
                              //             Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.spaceBetween,
                              //               children: [
                              //                 Text(
                              //                   product.offerItems[index].name,
                              //                   style: TextStyle(
                              //                       fontSize: 12,
                              //                       color: Colors.black),
                              //                 ),
                              //                 SubOfferItem(
                              //                   totalPrice: totalPriceOffer,
                              //                   productoffer:
                              //                       product.offerItems[index],
                              //                   quantity: quantityOffer,
                              //                 ),
                              //               ],
                              //             ),
                              //             Divider(
                              //               color: Colors.black12,
                              //               thickness: 1,
                              //             )
                              //           ],
                              //         );
                              //       },
                              //     ),
                              //   ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .025),
                              Text(
                                DemoLocalizations.of(context).title['makenote'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(h.blueColor),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .015),
                              Container(
                                width: MediaQuery.of(context).size.width * .9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 2,
                                  keyboardType: TextInputType.text,
                                  //textDirection: lang=="ar"?TextDirection.rtl:TextDirection.ltr,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      right: 15,
                                      left: 15,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    enabledBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black12)),
                                    focusedBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.black12)),
                                    focusedErrorBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    errorBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    hintText: DemoLocalizations.of(context)
                                            .title[
                                        'Wouldyouliketotellusanythingelse?'],
                                    hintStyle: TextStyle(
                                        color: Colors.black54, fontSize: 10),
                                    prefixIcon: Icon(
                                      Icons.message,
                                      color: Colors.black26,
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                        maxHeight: 25,
                                        minHeight: 20,
                                        maxWidth: 50,
                                        minWidth: 40),
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      noteMessage = value;
                                    });
                                  },
                                  // controller: message,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                        margin: EdgeInsets.only(
                            //right:  MediaQuery.of(context).size.width*.2,
                            //left:  MediaQuery.of(context).size.width*.2
                            ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(h.blueColor),
                        ),
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.width * .9,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .07,
                          right: MediaQuery.of(context).size.width * .07,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<SlmlmProvider>(
                              builder: (context, ch, _) => Text(
                                "${double.parse(ch.subProduct != null ? ch.subProduct.price2 : product.price2) * ch.quantity + Provider.of<SlmlmProvider>(context, listen: false).totalPriceOffer}" +
                                    DemoLocalizations.of(context)
                                        .title['currency'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Text(
                              DemoLocalizations.of(context).title['addtoCart'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        )),
                    onTap: () async {
                      // Navigator.pushNamed(context, '/Cart');
                      CartMedelLocal p1 = new CartMedelLocal({
                        "id": int.parse(product.id),
                        "name": product.name,
                        "img": product.image,
                        "description": product.description,
                        "price": double.parse(product.price),
                        "offerPrice":
                            Provider.of<SlmlmProvider>(context, listen: false)
                                .totalPriceOffer,
                        "price2": double.parse(product.price2),
                        "totalPrice": double.parse(Provider.of<SlmlmProvider>(
                                                context,
                                                listen: false)
                                            .subProduct !=
                                        null
                                    ? Provider.of<SlmlmProvider>(context,
                                            listen: false)
                                        .subProduct
                                        .price2
                                    : product.price2) *
                                Provider.of<SlmlmProvider>(context,
                                        listen: false)
                                    .quantity +
                            Provider.of<SlmlmProvider>(context, listen: false)
                                .totalPriceOffer,
                        "quantity":
                            Provider.of<SlmlmProvider>(context, listen: false)
                                .quantity,
                        "selectedTypeName": Provider.of<SlmlmProvider>(context,
                                        listen: false)
                                    .subProduct !=
                                null
                            ? Provider.of<SlmlmProvider>(context, listen: false)
                                .subProduct
                                .name
                            : product.name,
                        "offerName":
                            Provider.of<SlmlmProvider>(context, listen: false)
                                .totalofferNames,
                        'message': noteMessage,
                      });
                      try {
                        Navigator.pop(context);
                        addProductDialog(
                            context,
                            Provider.of<SlmlmProvider>(context, listen: false)
                                .quantity);
                        await dbHelper.addToCart(p1);
                      } catch (e) {
                        Navigator.pop(context);
                        addProductDialog(
                            context,
                            Provider.of<SlmlmProvider>(context, listen: false)
                                .quantity);
                        dbHelper.updateCourse(p1);
                      }
                    },
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addProductDialog(BuildContext context, int count) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 150.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              border: Border.all(color: Colors.black12, width: 2.0),
              color: Colors.white),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Colors.white),
                                  // padding:EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 13),
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    size: 50,
                                    color: Color(h.mainColor),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(1000)),
                                        color: Color(h.mainColor)),
                                    padding: EdgeInsets.all(2.5),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            DemoLocalizations.of(context).title['adddone'],
                            style: TextStyle(
                                color: Color(h.blueColor),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            DemoLocalizations.of(context).title['qunt'] +
                                "$count",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          // Text("${title}",textAlign: TextAlign.center,)
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
