import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mishwar/Model/OrdersModel.dart';
import 'package:mishwar/app/Services/OrderServices.dart';
import '../main.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:mishwar/lang/app_Localization.dart';
import 'map_customize.dart';
import 'orderItem.dart';

class OrderDetails extends StatefulWidget {
  final OrdersList orderList;

  const OrderDetails({Key key, this.orderList}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  bool startMove = false;
  OrderServices orderServices = new OrderServices();
  home h = new home();

  // getOrderDetails() async {
  //   orderDetail = await orderServices.GetOrdersDetailsUpdate(
  //       widget.orderList.orderID.toString());
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.orderList.allQuantity);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          DemoLocalizations.of(context).title['requestdetails'],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
        ),
        backgroundColor: Color(h.mainColor),
      ),
      body: widget.orderList == null
          ? CircularProgressIndicator(
              color: Color(h.mainColor),
            )
          : Column(
              children: [
                // CustomAppBar(DemoLocalizations.of(context).title['requestdetails']),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05),
                  child: Column(
                    children: [
                      Container(
                        //update in value
                        height: MediaQuery.of(context).size.height * .3,
                        // widget.orderList.orderStatusID == 2
                        //     ? MediaQuery.of(context).size.height * .3
                        //     : MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width,
                        // child: ClipRRect(
                        //     borderRadius: BorderRadius.all(Radius.circular(10)),
                        //     child: GoogleMapBody(
                        //       trackProvider: true,
                        //       removeMarker: false,
                        //       lat: 26.290515856510165,
                        //       lng: 50.210132893519344,
                        //       driverLat: double.parse(widget.orderList.latitude),
                        //       driverLong: double.parse(widget.orderList.longitude),
                        //
                        //     ),
                        // ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: GoogleMapCustomize(
                            clientLat:
                                double.parse(widget.orderList.addressLat),
                            clientLng:
                                double.parse(widget.orderList.addressLong),
                            driverLat: double.parse(widget.orderList.latitude),
                            driverLong:
                                double.parse(widget.orderList.longitude),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.orderList.region ?? '',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              widget.orderList.address ?? '',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87.withOpacity(.6)),
                            ),
                            Text(
                              widget.orderList.phone ?? '',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87.withOpacity(.6)),
                            ),
                            // Text(
                            //   'asdasdasdasd',
                            //   // "رقم هاتف :${widget.orderDetail.orderAddress.phone1}",
                            //   style: TextStyle(
                            //       fontSize: 11,
                            //       color: Colors.black87.withOpacity(.6)),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Divider(
                  color: Colors.black12,
                  height: 1,
                  thickness: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05),
                  child: Row(
                    children: [
                      Text(
                        DemoLocalizations.of(context).title['products'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: widget.orderList.items.length ?? 0,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .01,
                    ),
                    itemBuilder: (context, index) {
                      return OrderItem(
                        orderDetail: widget.orderList.items[index],
                        orderDate: widget.orderList.orderDate,
                      );
                    },
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border:
                                Border.all(color: Colors.black12, width: 1)),
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
                                DemoLocalizations.of(context)
                                    .title['requestdetails'],
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black12,
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .3 -
                                          2,
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    DemoLocalizations.of(context).title['qunt'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    DemoLocalizations.of(context).title['Tax'] +
                                        ' 15 % ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  //Totaldemand
                                  child: Text(
                                    DemoLocalizations.of(context)
                                        .title['Totaldemand'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.width * .27,
                                  color: Colors.black12,
                                ),
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.width * .27,
                                  color: Colors.black12,
                                ),
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.width * .27,
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .3 -
                                          2,
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.orderList.allQuantity.toString(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    // double.parse(widget.orderList.tax)
                                    //         .toStringAsFixed(2)
                                    //         .toString() +
                                    ' ${(widget.orderList.tax)} ' +
                                        DemoLocalizations.of(context)
                                            .title['currency'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${(widget.orderList.subTotal)} ' +
                                        DemoLocalizations.of(context)
                                            .title['currency'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment:
                            //   MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Container(
                            //       height: 1,
                            //       width:
                            //       MediaQuery.of(context).size.width * .27,
                            //       color: Colors.black12,
                            //     ),
                            //     Container(
                            //       height: 1,
                            //       width:
                            //       MediaQuery.of(context).size.width * .27,
                            //       color: Colors.black12,
                            //     ),
                            //     Container(
                            //       height: 1,
                            //       width:
                            //       MediaQuery.of(context).size.width * .27,
                            //       color: Colors.black12,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * .02,
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(h.blueColor),
                    ),
                    height: MediaQuery.of(context).size.height * .05,
                    //  width: MediaQuery.of(context).size.width*.8,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .07,
                      right: MediaQuery.of(context).size.width * .07,
                    ),
                    child: Text(
                        DemoLocalizations.of(context).title['Total'] +
                            " : " +
                            '${(widget.orderList.totalValue)} ' +
                            " " +
                            DemoLocalizations.of(context).title['currency'],
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                )
              ],
            ),
    );
  }
}
