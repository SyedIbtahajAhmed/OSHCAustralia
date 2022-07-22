import 'dart:js';

import 'package:flutter/material.dart';
import 'package:oshcaustralia/Screens/ChildScreens/generic.dart';
import 'package:oshcaustralia/Screens/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const Home());
      case '/home':
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const Home());
      case '/generic':
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const GenericScreen());
      default:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const Home());
    }
  }
}