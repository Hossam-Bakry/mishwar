import 'package:flutter/material.dart';
import 'package:mishwar/Screens/DelveryUser/getDeliveryValueProvider.dart';
import 'package:mishwar/lang/app_Localization.dart';
import 'package:mishwar/main.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mishwar/Screens/shared/button_ui.dart';
import 'package:mishwar/Model/AddressModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mishwar/app/Services/AddressServices.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mishwar/Screens/confirmedorderui/third_step_delivery.dart';
import 'package:mishwar/Screens/GlobalFunction.dart';
import 'package:mishwar/Screens/AddAddress.dart';
import 'package:mishwar/Screens/HomePage.dart';
import 'package:toast/toast.dart';

import '../edit_address.dart';
import 'first_step_user_data.dart';

class SecondStepAddress extends StatefulWidget {
  @override
  _SecondStepAddressState createState() => _SecondStepAddressState();
}

class _SecondStepAddressState extends State<SecondStepAddress> {
  AddressServices addressServices = new AddressServices();
  home h = new home();
  List<AddressModel> addressList;
  int selected = 0;
  SharedPreferences prefs;

  loadData() async {
    prefs = await SharedPreferences.getInstance();
    print('userId => ${prefs.getString("UserId")}');
    addressList = await addressServices.GetAddresses(prefs.getString("UserId"));
    if (addressList == null) {
      addressList = [];
    }
    // addressList = await addressServices.GetAddresses('4');

    print('address => $addressList');

    setState(() {});
    for (int i = 0; i < addressList.length; i++) {
      addressList[i].isPrimary == "1"
          ? prefs.setString("address_id", addressList[i].id)
          : print("s");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Color(0xffD4252F),
          title: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: DemoLocalizations.of(context).locale == Locale("en")
                      ? Icon(Icons.arrow_back_ios_rounded,
                          size: 25, color: Colors.white)
                      : Icon(Icons.arrow_forward_ios_rounded,
                          size: 25, color: Colors.white)),
              Expanded(
                child: Text(
                  DemoLocalizations.of(context).title['followupwiththeorder'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.025,
                    right: MediaQuery.of(context).size.width * 0.025),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FirstStepUserData(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                                DemoLocalizations.of(context).title['username'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLine(
                                dashColor: Colors.black87,
                                lineThickness: 2.0,
                                dashGapLength: 1.50,
                                dashRadius: 1.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Colors.white,
                                size: 20,
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(DemoLocalizations.of(context).title['address'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLine(
                                dashColor: Colors.black87,
                                lineThickness: 2.0,
                                dashGapLength: 1.50,
                                dashRadius: 1.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.local_shipping_rounded,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                                DemoLocalizations.of(context).title['Delivery'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                textAlign: TextAlign.right),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLine(
                                dashColor: Colors.black87,
                                lineThickness: 2.0,
                                dashGapLength: 1.50,
                                dashRadius: 1.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.payment,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(DemoLocalizations.of(context).title['payment'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLine(
                                dashColor: Colors.black87,
                                lineThickness: 2.0,
                                dashGapLength: 1.50,
                                dashRadius: 1.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(DemoLocalizations.of(context).title['confirm'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                textAlign: TextAlign.center),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black26,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .0,
              ),
              addressList == null
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : addressList.length > 0
                      ? Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    GlobalFunction.routeBottom(
                                      AddAddress("confirm"),
                                    ),
                                  );
                                },
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(10),
                                  color: Colors.black26,
                                  strokeWidth: 1.5,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .06,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            //  border: Border.all(width: 1.0,color: Colors.black26)
                                            color: Color(h.blueColor)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "images/plus.png",
                                              width: 18,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 15),
                                            Text(
                                              DemoLocalizations.of(context)
                                                  .title['addaddress'],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    padding: EdgeInsets.only(
                                        // left: MediaQuery.of(context).size.width * .05 - 3,
                                        // right: MediaQuery.of(context).size.width * .05,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                .03),
                                    itemCount: addressList.length,
                                    itemBuilder: (contect, index) {
                                      if (addressList[index].isPrimary == "1") {
                                        Future.delayed(Duration(seconds: 0),
                                            () async {
                                          Provider.of<GetDeliveryValueProvider>(
                                                  context,
                                                  listen: false)
                                              .getDeliveryValue(
                                            double.parse(
                                                addressList[index].deliveryFee),
                                          );
                                        });
                                        Provider.of<GetDeliveryValueProvider>(
                                                    context,
                                                    listen: false)
                                                .priceDelivery =
                                            double.parse(
                                                addressList[index].deliveryFee);
                                        print(
                                            'dlivery => ${Provider.of<GetDeliveryValueProvider>(context, listen: false).priceDelivery}');
                                        print(
                                            "e33e3e${addressList[index].deliveryFee}");
                                      }

                                      return Container(
                                          alignment: Alignment.center,
                                          height: 100,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 8),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade400,
                                                    offset: Offset(1, 2),
                                                    blurRadius: 4)
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    flex: 2,
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            addressList[index]
                                                                    .region ??
                                                                "",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            addressList[index]
                                                                    .title ??
                                                                "",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: Colors
                                                                  .black87
                                                                  .withOpacity(
                                                                      .6),
                                                            ),
                                                          ),
                                                          Text(
                                                            addressList[index]
                                                                    .landMark ??
                                                                "",
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: Colors
                                                                  .black87
                                                                  .withOpacity(
                                                                      .6),
                                                            ),
                                                          ),
                                                          Text(
                                                            // "رقم هاتف : ${addressList[index].phone1}",
                                                            "${addressList[index].phone1 ?? ""}",
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: Colors
                                                                  .black87
                                                                  .withOpacity(
                                                                      .6),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  /*SizedBox(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                                      width: 1,
                                                      height: 80,
                                                      color: Colors.black54,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditAddress(addressList[index]),));
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: Colors.orange.shade100,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Text(
                                                              DemoLocalizations.of(context).title['edit'],
                                                            ),
                                                            Icon(
                                                              Icons.edit,
                                                              size: 18,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                                      width: 1,
                                                      height: 80,
                                                      color: Colors.black54,
                                                    ),
                                                  ],
                                                ),
                                              ),*/
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    child: Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () async {
                                                            SharedPreferences pref = await SharedPreferences.getInstance();
                                                            pref.setString("address_id", addressList[index].id);
                                                            var responce = await addressServices.setPrimaryaddress(
                                                              prefs.getString("UserId"),
                                                              addressList[index].id,
                                                            );

                                                            // Map<String, dynamic>
                                                            //     responce =
                                                            //     await addressServices
                                                            //         .SetPrimaryAddress(
                                                            //             addressList[
                                                            //                     index]
                                                            //                 .id);
                                                            loadData();
                                                            print(responce);
                                                            setState(() {
                                                              selected = index;
                                                            });
                                                            Provider.of<GetDeliveryValueProvider>(context, listen: false).getDeliveryValue(
                                                              double.parse(addressList[index].deliveryFee),
                                                            );
                                                            print("delivery price : ${addressList[index].deliveryFee}");
                                                          },
                                                          child: selected == index
                                                          // addressList[index].isPrimary == "1"
                                                              ? Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Colors
                                                                      .green,
                                                                  size: 38,
                                                                )
                                                              : Container(
                                                                  width: 31,
                                                                  height: 31,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              3),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                        1000,
                                                                      ),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .black26,
                                                                      width: 1,
                                                                    ),
                                                                  ),
                                                                ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // Divider(
                                              //   color: Colors.black26,
                                              //   thickness: 1.5,
                                              // )
                                            ],
                                          ));
                                    }),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                Image.asset(
                                  "images/noAddress.png",
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                Text(
                                  "لم تقم باضافة عناوين بعد",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        GlobalFunction.routeBottom(
                                            AddAddress("confirm")));
                                  },
                                  child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(10),
                                      color: Colors.black26,
                                      strokeWidth: 1.5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .6,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .06,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              //  border: Border.all(width: 1.0,color: Colors.black26)
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "images/plus.png",
                                                  width: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "أضافة عنوان",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black54),
                                                ),
                                              ],
                                            )),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
              ButtonUi(
                widget: Text(
                  DemoLocalizations.of(context).title['next'],
                  style: TextStyle(color: Colors.white),
                ),
                backColor: Theme.of(context).accentColor,
                function: () {
                  //"address_id"
                  if (prefs.getString("address_id") != null) {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            ThirdStepDelivery(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  } else {
                    Toast.show(
                        DemoLocalizations.of(context).title['choosaddress'],
                        context,
                        duration: Toast.LENGTH_LONG,
                        gravity: Toast.BOTTOM);
                  }
                },
                doubleValue: MediaQuery.of(context).size.width - 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
