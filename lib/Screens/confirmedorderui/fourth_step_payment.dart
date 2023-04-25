import 'package:flutter/material.dart';
import 'package:mishwar/Screens/confirmedorderui/paymentProvider.dart';
import 'package:mishwar/Screens/confirmedorderui/second_step_address.dart';
import 'package:mishwar/Screens/confirmedorderui/third_step_delivery.dart';
import 'package:mishwar/Screens/paymentscreen/ready_ui.dart';
import 'package:mishwar/lang/app_Localization.dart';
import 'package:mishwar/main.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:mishwar/Screens/shared/button_ui.dart';
import 'package:mishwar/Screens/confirmedorderui/fifth_step_confirm.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:mishwar/Screens/HomePage.dart';
import 'package:mishwar/app/AppConfig.dart';

import '../GlobalFunction.dart';
import '../PaymentMethod.dart';
import '../payment_provider.dart';
import '../paymentscreen/payment_form.dart';
import 'first_step_user_data.dart';
import 'onlinePayment.dart';

class FourthStepPayment extends StatefulWidget {
  @override
  _FourthStepPaymentState createState() => _FourthStepPaymentState();
}

class _FourthStepPaymentState extends State<FourthStepPayment> {
  home h = new home();
  String payment;
  PaymentProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<PaymentProvider>(context, listen:  false);
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
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SecondStepAddress(),
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
                              DemoLocalizations.of(context).title['address'],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                              textAlign: TextAlign.center,
                            ),
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
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ThirdStepDelivery(),
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
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle),
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
                height: MediaQuery.of(context).size.height * .02,
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .25,
                    height: MediaQuery.of(context).size.width * .25,
                    child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000)),
                            border:
                                Border.all(color: Color(h.blueColor), width: 3),
                            color: Colors.white),
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.payment,
                          color: Colors.black87,
                          size: 55,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .0005,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .01,
                        bottom: MediaQuery.of(context).size.height * .01,
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05),

                    alignment: Alignment.center,
                    //Paymentmethod
                    child: Text(
                      DemoLocalizations.of(context).title['Paymentmethod'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * .9,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black12.withOpacity(.1),
                          width: 1,
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * .02,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(context, GlobalFunction.route(PaymentMethod()));
                              setState(() {
                                payment = "payment1";
                              });
                              appConfig.prefs.setString(
                                  'paymethodtext',
                                  DemoLocalizations.of(context)
                                      .title['Paiementwhenrecieving']);
                              appConfig.prefs.setInt('paymethodvalue', 1);
                            },
                            child: Container(
                              height: 30,
                              // color: Colors.red,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Radio(
                                    activeColor: Color(h.mainColor),
                                    value: "payment1",
                                    groupValue: payment,
                                    onChanged: (String value) {
                                      setState(() {
                                        payment = value;
                                      });
                                      appConfig.prefs.setString(
                                          'paymethodtext',
                                          DemoLocalizations.of(context)
                                              .title['Paiementwhenrecieving']);
                                      appConfig.prefs
                                          .setInt('paymethodvalue', 1);
                                    },
                                    //Paiementwhenrecieving
                                  ),
                                  Text(
                                    DemoLocalizations.of(context)
                                        .title['Paiementwhenrecieving'],
                                    maxLines: 1,
                                    style: TextStyle(
                                      height: 1,
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Divider(
                            color: Colors.black12.withOpacity(.1),
                            thickness: 1,
                          ),
                          SizedBox(height: 0),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isDismissible: true,
                                isScrollControlled: true,
                                builder: (context) {
                                  return selectionBottomSheet(
                                    context,
                                  );
                                },
                              );
                              // Navigator.push(context,
                              //     GlobalFunction.route(OnlinePaymentWebView()));
                              // GlobalFunction.route(PaymentMethod()));
                              setState(() {
                                payment = "payment2";
                              });
                              // appConfig.prefs.setString(
                              //     'paymethodtext',
                              //     DemoLocalizations.of(context)
                              //         .title['Bycreditcard']);
                              // appConfig.prefs.setInt('paymethodvalue', 2);
                            },
                            child: Container(
                                height: 30,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Radio(
                                      activeColor: Color(h.mainColor),
                                      value: "payment2",
                                      groupValue: payment,
                                      onChanged: (String value) {
                                        setState(() {
                                          payment = value;
                                        });
                                        //   appConfig.prefs.setString(
                                        //       'paymethodtext',
                                        //       DemoLocalizations.of(context)
                                        //           .title['Bycreditcard']);
                                        //   appConfig.prefs
                                        //       .setInt('paymethodvalue', 2);
                                      },
                                    ),
                                    //Bycreditcard
                                    Text(
                                        DemoLocalizations.of(context)
                                            .title['Bycreditcard'],
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12)),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                ],
              ),
              Expanded(
                child: SizedBox(
                  width: 0.0,
                ),
              ),
              ButtonUi(
                widget: Text(
                  DemoLocalizations.of(context).title['next'],
                  style: TextStyle(color: Colors.white),
                ),
                backColor: Theme.of(context).accentColor,
                function: () {
                  if (payment == null && provider.paymentType.isEmpty) {
                    Toast.show(
                        DemoLocalizations.of(context)
                            .title['Pleasechooseapaymentmethod'],
                        context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM);
                  } else {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            FifthStepConfirm(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
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
  Widget selectionBottomSheet(
      BuildContext context,
      ) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    List<String> paymentList = [
      "images/Bitmap1.png",
      "images/Bitmap2.png",
      "images/MADA.png"
    ];
    int selectedIndex;
    String paymentType;
    double amount;

    return FractionallySizedBox(
      heightFactor: 0.4,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            padding: EdgeInsets.symmetric(
              horizontal: mediaQuery.size.width * 0.064,
              vertical: mediaQuery.size.height * 0.035,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Chose Your Payment Type",
                    style: theme.textTheme.titleLarge
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: mediaQuery.size.height * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              if(index == 0){
                                paymentType = "VISA";
                              } else if(index == 1){
                                paymentType = "MASTERCARD";
                              } else {
                                paymentType = "MADA";
                              }
                            });
                          },
                          child: Container(
                            width: mediaQuery.size.width * 0.25,
                            padding: EdgeInsets.all(8.0),

                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: selectedIndex == index
                                    ? theme.primaryColor
                                    : Colors.white,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 1, color: Colors.grey.shade400)
                              ],
                            ),
                            child: Image.asset(paymentList[index]),
                          ),
                        );
                      },
                      itemCount: 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.setPaymentType(paymentType);
                      if (provider.paymentType == null) {
                        Toast.show(
                            DemoLocalizations.of(context)
                                .title['Pleasechooseapaymentmethod'],
                            context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      } else {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                FifthStepConfirm(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }
                      debugPrint(provider.paymentType);
                      // Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: mediaQuery.size.width * 0.7,
                      margin: EdgeInsets.only(top: 16.0),
                      height: 50,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Text(
                        DemoLocalizations.of(context)
                            .title['select'],
                        style: theme.textTheme.titleMedium.copyWith(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


