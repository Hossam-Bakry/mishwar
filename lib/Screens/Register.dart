import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mishwar/app/Services/UserServices.dart';
import 'package:mishwar/app/Services/snackbar_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mishwar/lang/app_Localization.dart';
import '../main.dart';
import 'GlobalFunction.dart';
import 'Verification.dart';

class Register extends StatefulWidget {

  String phoneNumber;

  Register({this.phoneNumber});

  @override
  State<StatefulWidget> createState() {
    return signInState();
  }
}

class signInState extends State<Register> {



  UserServices userServices = new UserServices();
  home h = new home();
  Map<String, dynamic> data;

  // Map<String, dynamic> data;
  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController password2 = new TextEditingController();

  final phoneNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  final password2Node = FocusNode();
  bool passVisibility = true;
  bool passVisibility2 = true;
  var key = "00966";
  final formKey = GlobalKey<FormState>();
  String error;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(h.whiteColor),
      appBar: AppBar(
        backgroundColor: Color(h.whiteColor),
        elevation: 0,
        toolbarHeight: 80,
        leadingWidth: 80,
        // iconTheme: IconThemeData(
        //   color: Colors.black87,
        //   size: 35,
        // ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: 35,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .05,
                left: MediaQuery.of(context).size.width * .05),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Container(
                  height: 190,
                  width: 190,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                    ),

                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .012,
                ),
                Divider(
                  color: Color(h.borderColor),
                  thickness: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // user Name
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(phoneNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return DemoLocalizations.of(context)
                                  .title['Entertheusername'];
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(h.mainColor)),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black45),
                            contentPadding: EdgeInsets.only(
                                right: 15, left: 15, top: 10, bottom: 10),
                            enabledBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(h.borderColor))),
                            focusedBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.FocusBorderColor))),
                            focusedErrorBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.ErorrBorderColor))),
                            errorBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.ErorrBorderColor))),
                            //name
                            hintText:
                                DemoLocalizations.of(context).title['name'],
                            prefixIcon: Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.black45,
                            ),
                          ),
                          controller: name,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // phone number
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .62,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextFormField(
                                focusNode: phoneNode,
                                keyboardType: TextInputType.phone,
                                initialValue: widget.phoneNumber,
                                enabled: false,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(emailNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return DemoLocalizations.of(context)
                                        .title['phonerequired'];
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(h.mainColor)),
                                    contentPadding: EdgeInsets.only(
                                        right: 10, left: 10, top: 0, bottom: 0),
                                    enabledBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(h.borderColor))),
                                    border: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(h.borderColor))),
                                    focusedBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(h.FocusBorderColor))),
                                    focusedErrorBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(h.ErorrBorderColor))),
                                    errorBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(h.ErorrBorderColor))),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: 20,
                                      color: Colors.black45,
                                    ),
                                    // hintText: '050000000',
                                    // hintStyle: TextStyle(
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 12,
                                    //     color: Colors.black45),
                                ),
                                // controller: phone,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * .26,
                                height: 47,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      width: 1,
                                      color: isError
                                          ? Color(h.ErorrBorderColor)
                                          : Color(h.borderColor)),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    right: MediaQuery.of(context).size.width *
                                        .01),
                                child:
                                    /*Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("996+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black45),),
                                SizedBox(width: 3,),
                                Image.asset("images/ar.png",height: 17,width: MediaQuery.of(context).size.width*.065,fit: BoxFit.fill,),
                              ],
                            )*/

                                    Container(
                                  //width: MediaQuery.of(context).size.width*.22,
                                  alignment: Alignment.center,
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: CountryCodePicker(
                                      alignLeft: false,
                                      padding: EdgeInsets.zero,
                                      onChanged: (v) {
                                        setState(() {
                                          key = v.toString();
                                        });
                                        print(key);
                                      },
                                      enabled: false,
                                      dialogTextStyle: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                      hideMainText: false,
                                      showFlagMain: true,
                                      showFlag: true,
                                      initialSelection: 'SA',
                                      hideSearch: false,
                                      textStyle: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                      favorite: ["EG", "SA"],
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(passwordNode);
                          },
                          focusNode: emailNode,
                          // ignore: missing_return
                          validator: (value) {},
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(h.mainColor)),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black45),
                            contentPadding: EdgeInsets.only(
                                right: 15, left: 15, top: 10, bottom: 10),
                            enabledBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(h.borderColor))),
                            focusedBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.FocusBorderColor))),
                            focusedErrorBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.ErorrBorderColor))),
                            errorBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.ErorrBorderColor))),
                            hintText:
                                '${DemoLocalizations.of(context).title['email']}   (${DemoLocalizations.of(context).title['optional']})',
                            prefixIcon: Icon(
                              Icons.markunread,
                              size: 20,
                              color: Colors.black45,
                            ),
                          ),
                          controller: email,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(password2Node);
                          },
                          focusNode: passwordNode,
                          obscureText: passVisibility,
                          validator: (value) {
                            if (value.isEmpty) {
                              return DemoLocalizations.of(context)
                                  .title['passowrdrequired'];
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(h.mainColor)),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black45),
                            contentPadding: EdgeInsets.only(
                                right: 15, left: 15, top: 10, bottom: 10),
                            enabledBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(h.borderColor))),
                            focusedBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.FocusBorderColor))),
                            focusedErrorBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.ErorrBorderColor))),
                            errorBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.ErorrBorderColor))),
                            hintText:
                                DemoLocalizations.of(context).title['pass'],
                            prefixIcon: Icon(
                              Icons.https_rounded,
                              size: 20,
                              color: Colors.black45,
                            ),
                            suffixIcon: InkWell(
                              child: Icon(
                                passVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black38,
                              ),
                              onTap: () {
                                setState(() {
                                  passVisibility = !passVisibility;
                                });
                              },
                            ),
                          ),
                          controller: password,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          focusNode: password2Node,
                          obscureText: passVisibility2,
                          validator: (value) {
                            if(value.isEmpty) {
                              return DemoLocalizations.of(context)
                                  .title['confirmnewpasswordrequired'];
                            } else if (value.compareTo(password.text) != 0 ) {
                              return DemoLocalizations.of(context)
                                  .title['confirmnewpasswordnotmatched'];
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(h.mainColor)),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black45),
                            contentPadding: EdgeInsets.only(
                                right: 15, left: 15, top: 10, bottom: 10),
                            enabledBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(h.borderColor))),
                            focusedBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.FocusBorderColor))),
                            focusedErrorBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.ErorrBorderColor))),
                            errorBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(h.ErorrBorderColor))),
                            hintText: DemoLocalizations.of(context)
                                .title['confirmnewpassword'],
                            prefixIcon: Icon(
                              Icons.https_rounded,
                              size: 20,
                              color: Colors.black45,
                            ),
                            suffixIcon: InkWell(
                              child: Icon(
                                passVisibility2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black38,
                              ),
                              onTap: () {
                                setState(() {
                                  passVisibility2 = !passVisibility2;
                                });
                              },
                            ),
                          ),
                          controller: password2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      error == null
                          ? SizedBox()
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Text(
                                error,
                                style: TextStyle(
                                    color: Color(h.ErorrBorderColor),
                                    fontSize: 12),
                              )),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {

                    if (formKey.currentState.validate()) {
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      print(
                        pref.getString("token"),
                      );
                      print(key + widget.phoneNumber);

                      // if (phone.text.substring(0, 1) == "0") {
                      //   setState(() {
                      //     phone.text = phone.text.substring(1);
                      //   });
                      //   print(key + widget.phoneNumber);
                      //   print(
                      //       "0000000000000000000000000000000000000000000000000");
                      // }
                      data = await userServices.RegisterServices(
                        name.text,
                        email.text,
                        password.text,
                        widget.phoneNumber
                      );
                      if(data["responseCode"] == 200) {
                        EasyLoading.dismiss();
                        SnackBarService.showSuccessMessage(
                          DemoLocalizations.of(context)
                              .title["youRegisteredSuccessfully"],
                        );
                        setData("UserId", data["userID"]);
                        setData("UserType", "1");
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/VerificationDone", (route) => false);
                      } else if(data["responseCode"] == 100){
                        SnackBarService.showErrorMessage(
                          DemoLocalizations.of(context)
                              .title["thisUserAleardyExist"],
                        );
                        EasyLoading.dismiss();
                      }
                      // if (data == -1) {
                      //   SnackBarService.showErrorMessage(
                      //     DemoLocalizations.of(context)
                      //         .title["thisUserAleardyExist"],
                      //   );
                      //   EasyLoading.dismiss();
                      // } else {
                      //   EasyLoading.dismiss();
                      //   SnackBarService.showErrorMessage(
                      //     DemoLocalizations.of(context)
                      //         .title["youRegisteredSuccessfully"],
                      //   );
                      //   setData("UserId", data.toString());
                      //   setData("UserType", "1");
                      //   Navigator.pushNamedAndRemoveUntil(
                      //       context, "/VerificationDone", (route) => false);
                      // }

                    } else {
                      setState(() {
                        isError = true;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(h.blueColor),
                    ),
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      DemoLocalizations.of(context).title['signUp'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  setData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
