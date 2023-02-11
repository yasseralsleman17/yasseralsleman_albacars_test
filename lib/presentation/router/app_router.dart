import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(title: 'Services', color: Colors.red),
        );
        break;
      case '/second':
        return MaterialPageRoute(
          builder: (context) =>   SecondScreen(
              title: 'Schedule', color: Colors.red),
        );
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (context) =>   ThirdScreen(
              title: 'Saved cards', color: Colors.red),
        );
        break;

      default:
        return null;
    }
  }


}
