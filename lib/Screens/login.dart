import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mishwar/Screens/GlobalFunction.dart';
import 'package:mishwar/app/Services/UserServices.dart';
import 'package:mishwar/app/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ForgetPassword.dart';
import '../main.dart';
import 'package:mishwar/lang/app_Localization.dart';

class login extends StatefulWidget {
  var type;

  login(var type) {
    this.type = type;
  }

  @override
  State<StatefulWidget> createState() {
    return loginState(this.type);
  }
}

class loginState extends State<login> {
  var type;

  loginState(var type) {
    this.type = type;
  }

  Map<String, dynamic> data;
  SharedPreferences prefs;
  String error;
  bool isError = false;
  var key = "+966";
  UserServices userServices = new UserServices();
  home h = new home();
  bool passVisibility = true;
  final passwordNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Map<String, dynamic> responce;
  String pass;

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05),
        child: ListView(
          //margin:
          //child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Image.asset(
              "images/logo.png",
              height: MediaQuery.of(context).size.height * .2,
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
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .66,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(passwordNode);
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
                                hintText: '051689586',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black45)),
                            controller: username,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * .22,
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
                                left: MediaQuery.of(context).size.width * .01,
                                right:
                                    MediaQuery.of(context).size.width * .01),
                            child: /*Row(
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
                                  flagWidth: 35,
                                  padding: EdgeInsets.zero,
                                  onChanged: (v) {
                                    setState(() {
                                      key = v.toString();
                                    });
                                    print(key);
                                  },
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
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
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
                            right: 15, left: 15, top: 0, bottom: 0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(h.borderColor))),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(h.FocusBorderColor))),
                        focusedErrorBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(h.ErorrBorderColor))),
                        errorBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(h.ErorrBorderColor))),
                        hintText: DemoLocalizations.of(context).title['pass'],
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
                            color: Colors.black45,
                          ),
                          onTap: () {
                            setState(() {
                              passVisibility = !passVisibility;
                            });
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        pass = value;
                      },
                      controller: password,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  GlobalFunction.routeBottom(ForgetPassword()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  DemoLocalizations.of(context).title['lost_password'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(h.blueColor),
                  ),
                ),
              ),
            ),
            error == null
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .03 - 5),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      error,
                      style: TextStyle(
                          height: 1,
                          color: Color(h.ErorrBorderColor),
                          fontSize: 12),
                    ),
                  ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            GestureDetector(
              onTap: () async => {
                if (formKey.currentState.validate())
                  {
                    prefs = await SharedPreferences.getInstance(),
                    print(username.text.substring(0, 1)),
                    if (username.text.substring(0, 1) == "0")
                      {
                        setState(() {
                          username.text = username.text.substring(1);
                        }),
                        print(username.text),
                        print(
                            "0000000000000000000000000000000000000000000000000"),
                      },
                    /*userLogin(username: username.text, password: password.text),*/

                   /* responce = await userServices.LoginServices(
                      username.text,
                      pass,
                      prefs.getString("token"),
                    ),*/

                    responce = await userServices.LoginServicesTest(
                      key.toString() + username.text.toString(),
                      pass.toString(),
                      prefs.getString("token"),
                    ),
                    // responce = userLogin(username: username.text, password: pass),

                    print('response  => ${responce}'),
                    print('token => ${prefs.getString("token")}'),

                    print(responce["message"]),

                    if (responce["statusCode"] == 200)
                      {
                        if (responce["message"]["user_roles"] == 1)
                          {
                            setData("UserId", responce["message"]["user_id"].toString()),
                            setData("UserType", responce["message"]["user_roles"].toString()),

                            data = await userServices.getUserData(responce["message"]["user_id"]),
                            print('profile data: ${data}'),

                            setState(() {
                              home.userImag = data["image"] ?? null;
                              home.phone = data["phone"];
                              home.username = data["name"];
                              home.email = data["email"];
                            }),
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/mainPage", (route) => false)
                            /*setData("UserId", responce["message"]["user_id"].toString()),
                            setData("UserType",
                                responce["message"]["user_roles"].toString()),
                            data = await userServices
                                .getUserData(responce["message"]["user_id"]),
                            setState(() {
                              home.userImag = data["message"]["image"];
                              home.phone = data["message"]["phone"];
                              home.username = data["message"]["name"];
                              home.email = data["message"]["email"];
                            }),
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/mainPage", (route) => false)*/
                          }
                        else
                          {
                            setData("UserId", responce["message"]["user_id"].toString()),
                            setData("driver_id", responce["message"]["driver_id"]),
                            setData("UserType", responce["message"]["user_roles"].toString()),
                            data = await userServices.getUserData(responce["message"]["user_id"]),
                            setState(() {
                              home.userImag = data["image"] ?? null;
                              home.phone = data["phone"];
                              home.username = data["name"];
                              home.email = data["email"];
                            }),
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/DeleverMain", (route) => false),
                          }
                      }
                    else
                      {
                        setState(() {
                          error = responce["message"];
                          print('the error => $error');
                          isError = false;
                        }),
                      }

                    //setData("UserId","12"),
                  }
                else
                  {
                    setState(() {
                      isError = true;
                    })
                  }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(h.mainColor),
                ),
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .6,
                alignment: Alignment.center,
                //signning
                child: Text(
                  DemoLocalizations.of(context).title['signning'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/Register");
              },
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(h.blueColor),
                ),
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .6,
                alignment: Alignment.center,
                child: Text(
                  DemoLocalizations.of(context).title['signUp'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
          //  ),
        ),
      ),
    );
  }

  setData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

   userLogin({
    @required String username,
    @required String password,
  }) {
    DioHelper.postData(
      url: "/api/user/login",
      query: {
        'username': username,
        'password': password,
      },
    ).then((value) {

      print(value.data);
      return value;
    }).catchError((error) {

      print(error.toString());
    });
  }
}
/*
cJXWJLaJRZiNrd0wLuxg_E:APA91bFEeWfAm0bHaVcnP85g4EUnYfBpk3I8MTeaTL8t8qZkfEas8HAgVYudooKPSfVdCA_h0oVPP7txiL5Ts9accKsqdjbnR0oMKiHM4u6q0Q2388zSAZvHTiV-3A2Qbl6Hna-SPr_h
d5rqdtR6TfmgO8HjbnUtPL:APA91bGndkas7w-N0LFWaBFoF5Lfb8Uaj28eR_ANm-VYyvVGh4JCjnn1T-GANXdRwT7p8ZClh1yXKynxUfJ2tbUO1GDeTZUMiGQbOpxGOxlKM4O6_z8oot2t8GdUk_ZPoS_VyyKc5VFq
*/