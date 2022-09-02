import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_utility/routes/routes.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'Paste your publishable key';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe Utility',
      initialRoute: AppRoutes.homeScreen,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => AppRoutes.appRoutes(AppRoutes.homeScreen),
    );
  }
}


