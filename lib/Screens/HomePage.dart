import 'package:flutter/material.dart';
import 'package:mishwar/Screens/Notifications.dart';
import 'package:mishwar/Screens/slmlmProvider.dart';
import 'package:mishwar/lang/app_Localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dbHelper.dart';
import 'GlobalFunction.dart';
import 'package:mishwar/Screens/myDrawer.dart';
import 'Branches.dart';
import '../main.dart';
import 'Cart.dart';
import 'Favourite.dart';
import 'Offers.dart';
import 'mainPage.dart';

class HomePage extends StatefulWidget {
  static String UserId;
  final int index;

  HomePage({this.index});

  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  int _currentIndex = 0;
  List dataLocal = [];
  DbHelper db = new DbHelper();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  home h = new home();

  loadCartItems() async {
    dataLocal = await db.allProduct();
    setState(() {});
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      HomePage.UserId = prefs.getString("UserId");
    });
  }

  List<Widget> itemsUi = [
    MainPage(),
    Expanded(child: Offers()),
    Expanded(child: Cart()),
    Expanded(child: Favourite()),
    Expanded(child: Branches()),
  ];
  List<String> titles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedpage();
    loadData();
  }

  void selectedpage() {
    if (widget.index != null) {
      setState(() {
        _currentIndex = widget.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    loadCartItems();

    titles = [
      DemoLocalizations.of(context).title['main'],
      DemoLocalizations.of(context).title['Offers'],
      DemoLocalizations.of(context).title['cart'],
      DemoLocalizations.of(context).title['favorite'],
      DemoLocalizations.of(context).title['branches'],
    ];
    //Observer
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 50,
          iconTheme: IconThemeData(size: 30,color: Colors.white),
          backgroundColor: Color(h.mainColor),
          centerTitle: true,
          title: Text(
            titles[_currentIndex],
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, GlobalFunction.routeBottom(Notifications()));
              },
              child: Container(
                padding: EdgeInsets.all(2),
                child: ImageIcon(
                  AssetImage("images/icon/notification.png"),
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 20),
          ]),
      drawer: MyDrawer(),
      key: _scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * .07,
            //   width: MediaQuery.of(context).size.width,
            //   color: Color(h.mainColor),
            //   padding: EdgeInsets.only(
            //     left: MediaQuery.of(context).size.width * .05,
            //     right: MediaQuery.of(context).size.width * .05,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           _scaffoldKey.currentState.openDrawer();
            //         },
            //         child: Container(
            //           padding: EdgeInsets.all(2),
            //           child: ImageIcon(
            //             AssetImage("images/icon/menu.png"),
            //             size: 22,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //       Text(
            //         titles[_currentIndex],
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 20,
            //             fontWeight: FontWeight.w600),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context, GlobalFunction.routeBottom(Notifications()));
            //         },
            //         child: Container(
            //           padding: EdgeInsets.all(2),
            //           child: ImageIcon(
            //             AssetImage("images/icon/notification.png"),
            //             size: 22,
            //             color: Colors.white,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            itemsUi[_currentIndex]
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15.5,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        selectedFontSize: 12,
        unselectedItemColor: Colors.black45,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/icon/home.png"),
              size: 18,
            ),
            label: DemoLocalizations.of(context).title['main'],
            /*Text(
              DemoLocalizations.of(context).title['main'],
              style: TextStyle(
                height: 1.75,
                fontSize: 10,
              ),
            ),*/
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/offerIcon.png"),
                size: 18,
              ),
              label: DemoLocalizations.of(context).title['Offers'],
             /* Text(
                DemoLocalizations.of(context).title['Offers'],
                style: TextStyle(
                  height: 1.75,
                  fontSize: 10,
                ),
              ),*/
          ),
          BottomNavigationBarItem(
              icon: Container(
                child: Stack(
                  alignment: Alignment(1.5, -6),
                  children: [
                    Container(
                      child: ImageIcon(
                        AssetImage(
                          "images/icon/cart_bar.png",
                        ),
                        size: 20,
                      ),
                    ),
                    dataLocal.length == 0
                        ? SizedBox()
                        : Stack(
                            alignment: Alignment(0, -0.2),
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(h.mainColor),
                                radius: 6.1,
                              ),
                              Text(
                                // '${Provider.of<SlmlmProvider>(context, listen: false).cartItems.length}',
                                '${dataLocal.length}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              label: DemoLocalizations.of(context).title['cart'],
              /*Text(
                DemoLocalizations.of(context).title['cart'],
                style: TextStyle(
                  height: 1.75,
                  fontSize: 10,
                ),
              ),*/
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star_border,
                size: 24,
              ),
              label: DemoLocalizations.of(context).title['favorite'],
             /* Text(
                DemoLocalizations.of(context).title['favorite'],
                style: TextStyle(
                  height: 1.75,
                  fontSize: 10,
                ),
              ),*/
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/icon/location.png"),
              size: 18,
            ),
            label: DemoLocalizations.of(context).title['branches'],
            /*Text(
              DemoLocalizations.of(context).title['branches'],
              style: TextStyle(
                height: 1.75,
                fontSize: 10,
              ),
            ),*/
          ),
        ],
      ),
    );
  }

}
