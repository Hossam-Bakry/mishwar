// import 'package:hyperpay/hyperpay.dart';
//
// class TestConfig implements HyperpayConfig {
//   @override
//   String creditcardEntityID = '8ac7a4c77b1ac40a017b259e7dc51661';
//   @override
//   String madaEntityID = '8ac7a4c77b1ac40a017b259fa4be1666';
//   @override
//   Uri checkoutEndpoint = _checkoutEndpoint;
//   @override
//   Uri statusEndpoint = _statusEndpoint;
//   @override
//   PaymentMode paymentMode = PaymentMode.test;
//
//   @override
//   String applePayEntityID;
// }
//
// class LiveConfig implements HyperpayConfig {
//   @override
//   String creditcardEntityID = '8ac7a4c77b1ac40a017b259e7dc51661';
//   @override
//   String madaEntityID = '8ac7a4c77b1ac40a017b259fa4be1666';
//   @override
//   Uri checkoutEndpoint = _checkoutEndpoint;
//   @override
//   Uri statusEndpoint = _statusEndpoint;
//   @override
//   PaymentMode paymentMode = PaymentMode.live;
//
//   @override
//   String applePayEntityID;
// }
//
// // Setup using your own endpoints.
// // https://wordpresshyperpay.docs.oppwa.com/tutorials/mobile-sdk/integration/server.
//
// String _host = "dev.hyperpay.com";
//
// Uri _checkoutEndpoint = Uri(
//   scheme: 'http',
//   host: _host,
//   path: 'hyperpay-demo/getcheckoutid.php',
// );
//
// Uri _statusEndpoint = Uri(
//   scheme: 'http',
//   host: _host,
//   path: 'hyperpay-demo/getpaymentstatus.php',
// );
//
//
// // String _host = "www.mishwar.elmasren.com/api";
// //
// // Uri _checkoutEndpoint = Uri(
// //   scheme: 'http',
// //   host: _host,
// //   path: '/Payment/PrepareCheckout',
// // );
// //
// //
// // Uri _statusEndpoint = Uri(
// //   scheme: 'http',
// //   host: _host,
// //   path: '/Payment/CheckPaymentStatus',
// // );
//
