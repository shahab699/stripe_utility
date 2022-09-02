
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stripe_utility/screens/home_screens/home_screen.dart';

class AppRoutes {
  static const String initializerPage = '/';
  static const String homeScreen = '/home';






  static Route<dynamic> appRoutes(final String routeName, {Map<String,dynamic>? arguments}) {
    switch (routeName) {
      case homeScreen:
        return PageTransition(child: const HomeScreen(), type: PageTransitionType.fade);


      default:
        throw UnimplementedError('Route is not implemented!');
    }
  }
}

