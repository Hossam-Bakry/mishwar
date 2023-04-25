import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:mishwar/Model/NotificationModel.dart';
import 'package:mishwar/Screens/Register.dart';
import 'package:mishwar/app/Services/snackbar_service.dart';

import 'GlobalVariables.dart';

class UserServices {
  String baseURL = GlobalVariables.URL;
  String GlobalURL = GlobalVariables.url;

  Future<Map<String, dynamic>> LoginServicesTest(
    var body,
  ) async {
    try {
      final responce = await http.post(
        Uri.parse('${GlobalURL}/User/appLogin'),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      // final responce = await http.post(uri);

      print('Responce => ${responce.body}');
      print("responce code => ${responce.statusCode}");
      print("0000000000000000000000000111111111111111111111111");

      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(' Error => ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> RegisterServices(
    var username,
    var email,
    var password,
    var phone,
  ) async {
    var body = {
      "AppUserId": 0,
      "Name": username,
      "Email": email,
      "Password": password,
      "Phone": phone,
      "Status": 1,
      "DeviceType": "Android",
      "UserRoles": 1
    };
    print(body);
    try {
      EasyLoading.show();
      final responce = await http.post(
        Uri.parse("${GlobalURL}/User/AppRegister"),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        // return responce;

        return json.decode(responce.body);
      }
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showUnexpectedErrorMessage();
      print(e.toString());
    }
  }

  Future<bool> checkMobile(String mobileNumber) async {
    try {
      final response = await http.get(
          Uri.parse("${GlobalURL}/User/CheckExistPhone?phone=$mobileNumber"));
      debugPrint("res check mobile ${response.statusCode}");
      if (response.body.isNotEmpty) {
        debugPrint("res check mobile ${response.body}");
        return json.decode(response.body);
      }
    } catch (e) {
      debugPrint(' Error => ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> sentOTP(String mobileNumber) async {
    try {
      final response = await http
          .get(Uri.parse("${GlobalURL}/User/SendOTPCode?phone=$mobileNumber&appName=Mishwar"));
      if (response.body.isNotEmpty) {
        debugPrint(response.body);
        return json.decode(response.body);
      }
    } catch (e) {
      debugPrint(' Error => ${e.toString()}');
    }
  }

  Future<bool> changePassword(
    String phone,
    String password,
  ) async {
    try {
      EasyLoading.show();
      final response = await http.get(
        Uri.parse(
            "${GlobalURL}/Users/ChangePassword?phone=$phone&password=$password"),
      );

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        return json.decode(response.body);
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> mobileActivation(var phone, var code) async {
    String url = baseURL + "/user/mobileActivation";
    print(url);
    var body = {"email": phone, "activcode": code};
    print(body);
    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> getUserData(var user_id) async {
    String url = GlobalURL + "/user/GetProfile?UserId=${user_id}";
    try {
      final response = await http.get(Uri.parse(url));

      print('get profile response: ${response.body}');

      if (response.body.isNotEmpty) {
        print(response.body);
        return json.decode(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> updateProfile(
      var user_id, var username, var email, var phone) async {
    String url = baseURL + "/user/updateProfile";
    var body = {
      "user_id": user_id,
      "username": username,
      "email": email,
      "phone": phone
    };
    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> sendCode(var phone) async {
    String url = baseURL + "/userForgetPassword/sendCode";
    print(url);
    var body = {
      "email": phone,
    };
    print(body);
    try {
      final responce = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: await getHeader(),
      );
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> CheckCode(var phone, var code) async {
    String url = baseURL + "/userForgetPassword/checkCode";
    print(url);
    var body = {
      "email": phone,
      "activecode": code,
    };
    print(body);
    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> changeForgetPassword(
      var phone, var code, var password, var verifyPassword) async {
    String url = baseURL + "/Userforgetpassword/change";
    print(url);
    print("ssssssssssssss");
    var body = {
      "email": phone,
      "activecode": code,
      "password": password,
      "verifypassword": verifyPassword
    };
    print(body);
    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<NotificationDetail>> GetNotifiction(var user_id) async {
    var url = "${GlobalVariables.URL}/notification/all";
    var body = {"user_id": user_id};
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: await getHeader());
      print(response.body);
      print("responceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      if (response.statusCode == 200 && response.body != null) {
        List slideritems =
            json.decode(utf8.decode(response.bodyBytes))["Message"];
        return slideritems.map((e) => NotificationDetail.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<void> deleteAccount(String user) async {
    var url = '${GlobalVariables.url}/users/RemoveUser?UserId=$user';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('delete account response: $response');
        return json.decode(response.body);
      }
    } catch (error) {
      print('$error,,,,error delete account');
    }
  }
}

/*  Future<Map<String, dynamic>> RegisterServices2(
    var username,
    var email,
    var password,
    var verifyPassword,
    var phone,
    var token,
  ) async {
    String url = baseURL + "/user/Register";
    print(url);
    var body = {
      "username": username,
      "email": email,
      "password": password,
      "verifypassword": verifyPassword,
      "phone": phone,
      "platform": "Android",
      "token": token
    };
    print(body);
    try {
      // final responce = await http.post(
      //   Uri.parse(url),
      //   body: json.encode(body),
      //   headers: await getHeader(),
      // );
      final responce = await http.get(
        Uri.parse(
            "${GlobalURL}/Users/Register?username=$username&phone=$phone&email=$email.com&password=$password"),
      );
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print("registeration response: ${responce.body}");
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }*/

/* Future<Map<String, dynamic>> LoginServices(
    var username,
    var password,
    var token,
  ) async {
    String url = baseURL + "/user/login";

    var body = {
      "username": username,
      "password": password,
      "platform": "Android",
      "token": token
    };

    print(body);
    try {
      final responce = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: await getHeader(),
      );
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        print(json.decode(responce.body));
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }*/
