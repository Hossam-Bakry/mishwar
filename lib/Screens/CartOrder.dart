import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mishwar/Model/AddressModel.dart';
import 'package:mishwar/Screens/GlobalFunction.dart';
import 'package:mishwar/app/Services/AddressServices.dart';
import 'package:mishwar/app/Services/OrderServices.dart';
import 'package:mishwar/main.dart';
import 'package:provider/provider.dart';
import '../dbHelper.dart';
import 'package:mishwar/Model/CartModelLocal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DelveryUser/getDeliveryValueProvider.dart';
import 'DelveryUser/getbranch.dart';
import 'OrderSucess.dart';
import 'package:mishwar/lang/app_Localization.dart';
import 'package:mishwar/app/AppConfig.dart';

import 'cartOrderItem.dart';

class CartOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}

class _state extends State<CartOrder> {
  AddressServices addressServices = new AddressServices();
  home h = new home();
  OrderServices orderServvices = new OrderServices();
  int totalquantity = 0;
  double allPrice = 0.0;
  List dataLocal = [];
  double tax = 0.0;
  DbHelper db = new DbHelper();
  List<CartMedelLocal> productCarts = [];
  SharedPreferences prefs;
  List<AddressModel> addressList;
  double deliverCost = 0;

  loadData() async {
    dataLocal = await db.allProduct();
    setState(() {});
  }

  getDeliveryCost() async {
    prefs = await SharedPreferences.getInstance();
    addressList = await addressServices.GetAddresses(prefs.getString("UserId"));
    print('address => $addressList');

    for (int i = 0; i < addressList.length; i++) {
      if (addressList[i].isPrimary == "1") {
        deliverCost = double.parse(addressList[i].deliveryFee);
        break;
      }
      // addressList[i].isPrimary == "1"
      //     ? deliverCost =  double.parse(addressList[i].deliveryFee )
      // // prefs.setString("address_id", addressList[i].id)
      //     : print("s");
    }
    setState(() {});
  }

  getTotal() async {
    print("555555555555555555555555");
    List product = await db.allProduct();
    // home.c=product.length;
    allPrice = 0.0;
    tax = 0.0;
    totalquantity = 0;
    for (int i = 0; i < product.length; i++) {
      CartMedelLocal c = new CartMedelLocal.fromMap(product[i]);
      totalquantity += c.quantity;
      allPrice += c.totalPrice;
      tax += (c.price * c.quantity * 15) / 100;
      print(tax.toString());
      print('quan => $totalquantity');
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    getTotal();
    getDeliveryCost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .013,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05),
                  child: Row(
                    children: [
                      Container(
                        //customername
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          DemoLocalizations.of(context).title['customername'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          home.username,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .05,
                    right: MediaQuery.of(context).size.width * .05,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          DemoLocalizations.of(context).title['phone'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width*.35,
                        child: Text(
                          home.phone,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05),
                  child: Row(
                    children: [
                      Container(
                        //email
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          DemoLocalizations.of(context).title['email'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          home.email,
                          style: TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .005,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .005,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          DemoLocalizations.of(context).title['Deliverymethod'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .55,
                        child: Text(
                          appConfig.prefs.getString('delmethodtext'),
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .005),
                // payment method
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          DemoLocalizations.of(context).title['Paymentmethod'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .55,
                        child: Text(
                          appConfig.prefs.getString('paymethodtext'),
                          // "?????????? ?????? ????????????????"
                          // appConfig.prefs.getString('paymethod'),
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .005,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          DemoLocalizations.of(context).title['DeliveryCharge'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .55,
                        child: Text(
                          '${Provider.of<GetDeliveryValueProvider>(context, listen: false).priceDelivery}  '
                              // "$deliverCost "
                              +
                              DemoLocalizations.of(context).title['currency'],
                          // "?????????? ?????? ????????????????"
                          // appConfig.prefs.getString('paymethod'),
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .005,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .05,
                    right: MediaQuery.of(context).size.width * .05,
                  ),
                  child: Row(
                    children: [
                      Text(
                        DemoLocalizations.of(context).title['products'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: dataLocal.length,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .01,
                    ),
                    itemBuilder: (context, index) {
                      print(dataLocal.length);
                      CartMedelLocal c =
                          new CartMedelLocal.fromMap(dataLocal[index]);
                      return CartOrderItem(
                        c: c,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .05,
              right: MediaQuery.of(context).size.width * .05,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.black12, width: 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .04,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            color: Color(0xffdedede).withOpacity(.5)),
                        alignment: Alignment.center,
                        child: Text(
                          DemoLocalizations.of(context).title['paymentDetails'],
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .3 - 2,
                            height: MediaQuery.of(context).size.height * .04,
                            decoration: BoxDecoration(),
                            alignment: Alignment.center,
                            child: Text(
                              DemoLocalizations.of(context).title['qunt'],
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.height * .04,
                            decoration: BoxDecoration(),
                            alignment: Alignment.center,
                            child: Text(
                              DemoLocalizations.of(context).title['Tax'] +
                                  "15%",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.height * .04,
                            decoration: BoxDecoration(),
                            alignment: Alignment.center,
                            child: Text(
                              DemoLocalizations.of(context)
                                  .title['Totaldemand'],
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * .27,
                            color: Colors.black12,
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * .27,
                            color: Colors.black12,
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * .27,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .3 - 2,
                            height: MediaQuery.of(context).size.height * .04,
                            decoration: BoxDecoration(),
                            alignment: Alignment.center,
                            child: Text(
                              totalquantity.toString(),
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.height * .04,
                            decoration: BoxDecoration(),
                            alignment: Alignment.center,
                            child: Text(
                              tax.toStringAsFixed(2) +
                                  DemoLocalizations.of(context)
                                      .title['currency'],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.height * .04,
                            decoration: BoxDecoration(),
                            alignment: Alignment.center,
                            child: Text(
                              ((allPrice).toStringAsFixed(2)).toString() +
                                  DemoLocalizations.of(context)
                                      .title['currency'],
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(h.blueColor),
                    ),
                    height: MediaQuery.of(context).size.height * .06,
                    //  width: MediaQuery.of(context).size.width*.8,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .07,
                      right: MediaQuery.of(context).size.width * .07,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            DemoLocalizations.of(context).title['Total'] +
                                " " +
                                (allPrice +
                                        Provider.of<GetDeliveryValueProvider>(
                                                context,
                                                listen: false)
                                            .priceDelivery)
                                    .toString() +
                                " " +
                                DemoLocalizations.of(context).title['currency'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Text(
                          DemoLocalizations.of(context)
                              .title['confirmpurchase'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    print(prefs.getString("UserId"));
                    print(prefs.getString("address_id"));
                    print("ssssssssssssss");
                    //  Navigator.push(context, GlobalFunction.routeBottom(Black()));
                    List Products = [];
                    for (int i = 0; i < dataLocal.length; i++) {
                      CartMedelLocal c =
                          new CartMedelLocal.fromMap(dataLocal[i]);
                      Items item = new Items(
                        ItemID: c.id.toString(),
                        Notes: c.offerName,
                        Quantity: c.quantity.toString(),
                        SalePrice: c.price2.toString(),
                        TotalValue: (c.price2 * c.quantity).toString(),
                        SubTotal: ((c.price2 * c.quantity) + ((c.price2 * c.quantity) * .15))
                            .toString(),
                      );
                      Products.add(item.toJson());
                    }
                    print('products => $Products');
                    print(Products.length);
                    print(
                        "00000000000000000000000000000000000000000000000000000000000000");
                    var body = {
                      "userID": prefs.getString("UserId"),
                      "subTotal": allPrice,
                      "tax": tax,
                      "totalValue": allPrice + deliverCost,
                      "addressID": prefs.getString("address_id"),
                      'appDeliveryType': appConfig.prefs.getInt('delmethodvalue'),
                      "appPaymentType": appConfig.prefs.getInt('paymethodvalue'),
                      "notes": "",
                      "items": Products
                    };
                    print(body);
                    print("0000000000000000000000000000000000000000");
                    Map<String, dynamic> data =
                        await orderServvices.MakeOrderUpdate(
                      body,
                      prefs.getString("UserId"),
                      Provider.of<GetUserBranch>(context, listen: false).branchId ,
                    );
                    print(' branchId : ${Provider.of<GetUserBranch>(context, listen: false).branchId}');
                    print(data);
                    if (data["statusCode"] == 200) {
                      print(data);
                      // AddToCard(context);

                      ///int quantity,int order_id,double subtotal,double totle,double tax

                      Navigator.push(
                          context,
                          GlobalFunction.routeBottom(OrderSuccess(
                            totalquantity,
                            data['key'],
                            allPrice,
                            this.allPrice,
                            this.tax,
                            deliverCost,
                          )));

                      db.deleteCart();
                      prefs.remove("address_id");
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AddToCard(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 130.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              border: Border.all(color: Colors.black12, width: 2.0),
              color: Colors.white),
          child: Stack(
            children: <Widget>[
              Column(
                //mainAxisAlignment: MainAxisAlignment.center
                // ,crossAxisAlignment: CrossAxisAlignment.start,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
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
                          DemoLocalizations.of(context)
                              .title['operationaccomplishedsuccessfully'],
                          style: TextStyle(
                            color: Color(h.blueColor),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
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

}

class Items {
  String ItemID;
  String Quantity;
  String SalePrice;
  String SubTotal;
  String TotalValue;
  String Notes;

  Items({
    this.ItemID,
    this.Quantity,
    this.SalePrice,
    this.SubTotal,
    this.TotalValue,
    this.Notes,
  });

  Map<String, dynamic> toJson() => {
        "ItemID": ItemID,
        "Quantity": Quantity,
        "Price": SalePrice,
        "SubTotal": SubTotal,
        "TotalValue": TotalValue,
        "Notes": Notes,
      };
}
