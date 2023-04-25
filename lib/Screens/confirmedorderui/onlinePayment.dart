// import 'package:awesome_card/credit_card.dart';
// import 'package:awesome_card/extra/card_type.dart';
// import 'package:awesome_card/extra/helper.dart';
// import 'package:awesome_card/style/card_background.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hyperpay/hyperpay.dart';
// import 'package:mishwar/Screens/confirmedorderui/paymentProvider.dart';
// import 'package:provider/provider.dart';
//
// import 'formatters.dart';
// import 'dart:math' as math;
//
// class CheckoutView extends StatefulWidget {
//   const CheckoutView({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   _CheckoutViewState createState() => _CheckoutViewState();
// }
//
// class _CheckoutViewState extends State<CheckoutView> {
//   // Awesome Card
//   String cardNumber = '';
//   String cardHolderName = '';
//   String expiryDate = '';
//   String cvv = '';
//   bool showBack = false;
//
//   FocusNode _focusNode;
//   TextEditingController cardNumberCtrl = TextEditingController();
//   TextEditingController expiryFieldCtrl = TextEditingController();
//
//
//   TextEditingController holderNameController = TextEditingController();
//   TextEditingController cardNumberController = TextEditingController();
//   TextEditingController expiryController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();
//
//   BrandType brandType = BrandType.none;
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
//   bool isLoading = false;
//   PayMentProvider payMentProvider;
//
//   @override
//   void initState() {
//     payMentProvider = Provider.of<PayMentProvider>(context, listen: false);
//     super.initState();
//
//     // Awesome Card
//     _focusNode = FocusNode();
//     _focusNode.addListener(() {
//       setState(() {
//         _focusNode.hasFocus ? showBack = true : showBack = false;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade100,
//         appBar: AppBar(
//           title: const Text(
//             "Checkout",
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//           iconTheme: IconThemeData(color: Colors.black),
//           elevation: 0,
//           // leading: Icon(Icons.arrow_back_ios),
//           backgroundColor: Colors.transparent,
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             alignment: Alignment.center,
//             // padding: const EdgeInsets.all(20.0),
//             // margin: const EdgeInsets.all(20.0),
//             decoration: BoxDecoration(color: Colors.white),
//             child: Form(
//               autovalidateMode: autovalidateMode,
//               child: Builder(
//                 builder: (context) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 20),
//                       CreditCard(
//                         cardNumber: cardNumber,
//                         cardExpiry: expiryDate,
//                         cardHolderName: cardHolderName,
//                         cvv: cvv,
//                         // bankName: 'Axis Bank',
//                         showBackSide: showBack,
//                         frontBackground: CardBackgrounds.black,
//                         backBackground: CardBackgrounds.white,
//                         showShadow: true,
//                         // mask: getCardTypeMask(cardType: CardType.americanExpress),
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           // Card Number
//                           Container(
//                             margin: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10,
//                             ),
//                             child: TextFormField(
//                               controller: cardNumberController,
//                               decoration: _inputDecoration(label: 'Card Number', icon: Icons.credit_card),
//                               // maxLength: 20,
//                               // onChanged: (value) {
//                               //   setState(() {
//                               //     brandType = value.detectBrand;
//                               //   });
//                               // },
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.digitsOnly,
//                                 LengthLimitingTextInputFormatter(brandType.maxLength),
//                                 CardNumberInputFormatter()
//                               ],
//                               validator: (String number) =>
//                                   brandType.validateNumber(number ?? ""),
//                               onChanged: (value) {
//                                 final newCardNumber = value.trim();
//                                 var newStr = '';
//                                 final step = 4;
//
//                                 for (var i = 0;
//                                     i < newCardNumber.length;
//                                     i += step) {
//                                   newStr += newCardNumber.substring(i,
//                                       math.min(i + step, newCardNumber.length));
//                                   if (i + step < newCardNumber.length)
//                                     newStr += ' ';
//                                 }
//
//                                 setState(() {
//                                   brandType = value.detectBrand;
//                                   cardNumber = newStr;
//                                   debugPrint(cardNumber.replaceAll(' ', ''));
//
//
//                                   debugPrint(value.detectBrand.toString());
//                                 });
//                               },
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               // Card Expiry
//                               Expanded(
//                                 child: Container(
//                                   margin: EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                   ),
//                                   child: TextFormField(
//                                     controller: expiryController,
//                                     // controller: expiryFieldCtrl,
//                                     inputFormatters: [
//                                       FilteringTextInputFormatter
//                                           .digitsOnly,
//                                       LengthLimitingTextInputFormatter(4),
//                                       CardMonthInputFormatter(),
//                                     ],
//                                     validator: (String date) =>
//                                         CardInfo.validateDate(date ?? ""),
//                                     decoration:
//                                         _inputDecoration(label: 'Card Expiry',icon:  Icons.date_range_rounded,),
//                                     // maxLength: 5,
//                                     onChanged: (value) {
//                                       var newDateValue = value.trim();
//                                       final isPressingBackspace =
//                                           expiryDate.length >
//                                               newDateValue.length;
//                                       final containsSlash =
//                                           newDateValue.contains('/');
//
//                                       if (newDateValue.length >= 2 &&
//                                           !containsSlash &&
//                                           !isPressingBackspace) {
//                                         newDateValue =
//                                             newDateValue.substring(0, 2) +
//                                                 '/' +
//                                                 newDateValue.substring(2);
//                                       }
//                                       setState(() {
//                                         expiryFieldCtrl.text = newDateValue;
//                                         expiryFieldCtrl.selection =
//                                             TextSelection.fromPosition(
//                                                 TextPosition(
//                                                     offset:
//                                                         newDateValue.length));
//                                         expiryDate = newDateValue;
//                                       });
//                                     },
//                                   ),
//
//                                 ),
//                               ),
//                               // CVV
//                               Expanded(
//                                 child: Container(
//                                   margin: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 10),
//                                   child: TextFormField(
//                                     controller: cvvController,
//                                     decoration: _inputDecoration(label: 'CVV', icon: Icons.confirmation_number_rounded,),
//                                     inputFormatters: [
//                                       FilteringTextInputFormatter
//                                           .digitsOnly,
//                                       LengthLimitingTextInputFormatter(3),
//                                     ],
//                                     // maxLength: 3,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         cvv = value;
//                                       });
//                                     },
//                                     validator: (String cvv) =>
//                                         CardInfo.validateCVV(cvv ?? ""),
//                                     focusNode: _focusNode,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // Card Holder Name
//                           Container(
//                             margin: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10,
//                             ),
//                             child: TextFormField(
//                               controller: holderNameController,
//                               decoration:
//                                   _inputDecoration(label: 'Card Holder Name', icon: Icons.account_circle_outlined),
//                               onChanged: (value) {
//                                 setState(() {
//                                   cardHolderName = value;
//                                 });
//                               },
//                             ),
//                           ),
//
//                            /*   Text(
//                               'CheckOut',
//                               style: TextStyle(
//                                 color: Colors.black87,
//                                 fontSize: 26,
//                               ),
//                             ),
//                             const SizedBox(height: 30),
//                             // Holder
//                             Text(
//                               'Name On Card',
//                               textDirection: TextDirection.ltr,
//                               style: TextStyle(color: Colors.black54),
//                             ),
//                             const SizedBox(height: 5),
//                             TextFormField(
//                               controller: holderNameController,
//                               decoration: _inputDecoration(
//                                 // label: "Card Holder",
//                                 hint: "Jane Jones",
//                                 icon: Icons.account_circle_rounded,
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//                             // Number
//                             Text(
//                               'Card Namber',
//                               textDirection: TextDirection.ltr,
//                               style: TextStyle(color: Colors.black54),
//                             ),
//                             const SizedBox(height: 5),
//                             TextFormField(
//                               controller: cardNumberController,
//                               decoration: _inputDecoration(
//                                 // label: "Card Number",
//                                 hint: "0000 0000 0000 0000",
//                                 icon: brandType == BrandType.none
//                                     ? Icons.credit_card
//                                     : 'images/${brandType.toString()}.png',
//                                 // : 'images/${brandType.asString}.png',
//                               ),
//                               onChanged: (value) {
//                                 setState(() {
//                                   brandType = value.detectBrand;
//                                 });
//                               },
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.digitsOnly,
//                                 LengthLimitingTextInputFormatter(
//                                     brandType.maxLength),
//                                 CardNumberInputFormatter()
//                               ],
//                               validator: (String number) =>
//                                   brandType.validateNumber(number ?? ""),
//                             ),
//                             const SizedBox(height: 12),
//                             // Number
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Expiry Data',
//                                         textDirection: TextDirection.ltr,
//                                         style: TextStyle(color: Colors.black54),
//                                       ),
//                                       const SizedBox(height: 5),
//                                       // Expiry date
//                                       TextFormField(
//                                         controller: expiryController,
//                                         decoration: _inputDecoration(
//                                           // label: "Expiry Date",
//                                           hint: "MM/YY",
//                                           icon: Icons.date_range_rounded,
//                                         ),
//                                         inputFormatters: [
//                                           FilteringTextInputFormatter
//                                               .digitsOnly,
//                                           LengthLimitingTextInputFormatter(4),
//                                           CardMonthInputFormatter(),
//                                         ],
//                                         validator: (String date) =>
//                                             CardInfo.validateDate(date ?? ""),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(width: 15),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'CVV',
//                                         textDirection: TextDirection.ltr,
//                                         style: TextStyle(color: Colors.black54),
//                                       ),
//                                       const SizedBox(height: 5),
//                                       // CVV
//                                       TextFormField(
//                                         controller: cvvController,
//                                         decoration: _inputDecoration(
//                                           // label: "CVV",
//                                           hint: "000",
//                                           icon:
//                                               Icons.confirmation_number_rounded,
//                                         ),
//                                         inputFormatters: [
//                                           FilteringTextInputFormatter
//                                               .digitsOnly,
//                                           LengthLimitingTextInputFormatter(4),
//                                         ],
//                                         validator: (String cvv) =>
//                                             CardInfo.validateCVV(cvv ?? ""),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),*/
//
//                           const SizedBox(height: 45),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             // alignment: Alignment.center,
//                             child: ElevatedButton(
//                               style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all(
//                                     Color(0xffD4252F)),
//                                 shape: MaterialStateProperty.all(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                 ),
//                               ),
//                               onPressed: isLoading
//                                   ? null
//                                   : () async {
//                                       final bool valid = Form.of(context)?.validate() ?? false;
//                                       if (valid) {
//                                         setState(() {
//                                           isLoading = true;
//                                         });
//
//                                         // Make a CardInfo from the controllers
//                                         CardInfo card = CardInfo(
//                                           holder: holderNameController.text,
//                                           cardNumber: cardNumber.replaceAll(' ', ''),
//                                           cvv: cvvController.text,
//                                           expiryMonth: expiryController.text
//                                               .split('/')[0],
//                                           expiryYear: '20' +
//                                               expiryController.text
//                                                   .split('/')[1],
//                                           // holder: cardHolderName,
//                                           // cardNumber: cardNumberCtrl.text.replaceAll(' ', ''),
//                                           // cvv: cvv,
//                                           // expiryMonth: expiryFieldCtrl.text.split('/')[0],
//                                           // expiryYear: '20' + expiryFieldCtrl.text.split('/')[1],
//
//                                           // cardNumber: cardNumberController
//                                           //     .text
//                                           //     .replaceAll(' ', ''),
//
//                                         );
//
//                                         try {
//
//
//                                           // Start transaction
//                                           if (payMentProvider.sessionCheckoutID.isEmpty) {
//
//                                             // Only get a new checkoutID if there is no previous session pending now
//                                             await payMentProvider.initPaymentSession(brandType, 0.1);
//                                             debugPrint("true");
//
//                                           }
//
//                                           final result = await payMentProvider.hyperpay.pay(card);
//
//                                           switch (result) {
//                                             case PaymentStatus.init:
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(
//                                                 const SnackBar(
//                                                   duration: Duration(seconds: 5),
//                                                   content: Text(
//                                                       'Payment session is still in progress'),
//                                                   backgroundColor: Colors.amber,
//                                                 ),
//                                               );
//                                               break;
//                                             // For the sake of the example, the 2 cases are shown explicitly
//                                             // but in real world it's better to merge pending with successful
//                                             // and delegate the job from there to the server, using webhooks
//                                             // to get notified about the final status and do some action.
//                                             case PaymentStatus.pending:
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(
//                                                 const SnackBar(
//                                                     duration: Duration(seconds: 5),
//                                                     content: Text(
//                                                         'Payment pending ⏳'),
//                                                     backgroundColor:
//                                                         Colors.amber),
//                                               );
//                                               break;
//                                             case PaymentStatus.successful:
//                                               payMentProvider.sessionCheckoutID = '';
//
//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(
//                                                 const SnackBar(
//                                                     duration: Duration(seconds: 5),
//                                                     content: Text('Payment approved 🎉'),
//                                                     backgroundColor: Colors.green),
//                                               );
//                                               break;
//
//                                             default:
//                                           }
//                                         } on HyperpayException catch (exception) {
//                                           payMentProvider.sessionCheckoutID = '';
//                                           ScaffoldMessenger.of(context).showSnackBar(
//
//                                             SnackBar(
//                                               duration: Duration(seconds: 5),
//                                               content: Text(exception.details ?? exception.message),
//                                               backgroundColor: Colors.red,
//                                             ),
//                                           );
//                                         } catch (exception) {
//                                           ScaffoldMessenger.of(context).showSnackBar(
//
//                                             SnackBar(
//                                               duration: Duration(seconds: 5),
//                                               content: Text('$exception'),
//                                             ),
//                                           );
//                                         }
//
//                                         setState(() {
//                                           isLoading = false;
//                                         });
//                                       } else {
//
//                                         setState(() {
//                                           autovalidateMode = AutovalidateMode.onUserInteraction;
//                                         });
//
//                                       }
//                                     },
//                               child: Text(
//                                 isLoading
//                                     ? 'Processing your request, please wait...'
//                                     : 'PAY',
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   InputDecoration _inputDecoration({String label, String hint, dynamic icon}) {
//     return InputDecoration(
//       hintStyle: TextStyle(fontSize: 14, color: Colors.black45),
//       hintText: hint,
//       labelText: label,
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 15),
//       filled: true,
//       enabled: true,
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.grey,
//         ),
//         borderRadius: BorderRadius.circular(6.0),
//       ),
//       contentPadding: EdgeInsets.all(8),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.grey,
//         ),
//         borderRadius: BorderRadius.circular(6.0),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(6.0),
//         borderSide: BorderSide(color: Colors.grey),
//       ),
//       fillColor: Colors.grey.shade200,
//       prefixIcon: icon is IconData
//           ? Icon(icon, color: Colors.grey,)
//           : Container(
//               padding: const EdgeInsets.all(2),
//               width: 0,
//               // child: Image.asset(icon),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class OnlinePaymentWebView extends StatefulWidget {
  String checkoutId;

  OnlinePaymentWebView({
    Key key,
    this.checkoutId,
  }) : super(key: key);

  @override
  _OnlinePaymentWebViewState createState() => _OnlinePaymentWebViewState();
}

class _OnlinePaymentWebViewState extends State<OnlinePaymentWebView> {
  WebViewXController webviewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: WebViewX(
        dartCallBacks: {
          DartCallback(
            name: 'Unique_Name_Here',
            callBack: (message) => print(message),
          ),
        },
        width: mediaQuery.width,
        height: mediaQuery.height,
        initialContent: """
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head runat="server">
          
            <title></title>
            
          </head>
          
          <body>
          
            <script src="https://test.oppwa.com/v1/paymentWidgets.js?checkoutId=${widget.checkoutId}"></script>
            
            <!--<script src="https://oppwa.com/v1/paymentWidgets.js?checkoutId=84079FA0E0297A28F17E31FFDCC96067.uat01-vm-tx01"></script>-->
            <form action="https://mishwar.com.sa/Result" class="paymentWidgets" data-brands="VISA MASTER MADA"></form>
            
          </body>
          
        </html>
        """,
        initialSourceType: SourceType.html,
        onWebViewCreated: (controller) => webviewController = controller,
      ),
    );
  }

  InputDecoration _inputDecoration({String label, String hint, dynamic icon}) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      prefixIcon: icon is IconData
          ? Icon(icon)
          : Container(
              padding: const EdgeInsets.all(6),
              width: 10,
              child: Image.asset(icon),
            ),
    );
  }
}
