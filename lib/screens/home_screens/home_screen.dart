import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              await makePayment();
            },
            child: Center(
              child: Container(
                width: 200,
                height: 40,
                decoration:  BoxDecoration(color: Colors.blue,
                borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text('Pay',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent(' 20', 'USD');

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntentData!['client_secret'],
                  applePay: const PaymentSheetApplePay(merchantCountryCode: 'US'),
                  googlePay: const PaymentSheetGooglePay(
                      merchantCountryCode: "US", currencyCode: "USD", testEnv: false),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Merchant Name'))
          .then((value) {});

      /// display payment sheet
      displayPaymentSheet();
    } catch (e) {
      debugPrint('exception$e');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              parameters: PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ))
          .then((newValue) {
        debugPrint('payment intent${paymentIntentData!['id']}');
        debugPrint('payment intent${paymentIntentData!['client_secret']}');
        debugPrint('payment intent${paymentIntentData!['amount']}');
        debugPrint('payment intent$paymentIntentData');
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        debugPrint('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      debugPrint('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      debugPrint('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);

      //making request to stripe server
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Paste your secret key',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      debugPrint('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      debugPrint('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
