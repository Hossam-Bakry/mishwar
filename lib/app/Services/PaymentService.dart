import 'dart:convert';

import 'package:flutter/material.dart';

import 'GlobalVariables.dart';
import 'package:http/http.dart' as http;


class PaymentService {


  String baseURL = GlobalVariables.url;

  Future<String> getCheckoutId({var body}) async {

    // var body = {
    //   "entityId": "8ac7a4c77b1ac40a017b259fa4be1666",
    //   "amount": amount,
    //   "currency": "SAR",
    //   "paymentType": "DB",
    //   "VisaType": visaType,
    // };

    try {
      final response = await http.post(
        Uri.parse("${baseURL}/Payment/PrepareCheckout"),
        body: json.encode(body),
        headers: await getHeader(),
      );
      if(response.statusCode == 200 ) {
        debugPrint(response.body.toString());
        debugPrint(json.decode(response.body)["id"]);
        return json.decode(response.body)["id"];
      }

    } catch (e) {
      print(e.toString());
    }
  }
}