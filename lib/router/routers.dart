import 'package:flutter/material.dart';
import 'package:shabake/presentation/Opportuniies/not_found/not_found_page.dart';
import 'package:shabake/presentation/Opportuniies/opportunities_page.dart';
import 'package:shabake/presentation/auth/sign_in_page.dart';
import 'package:shabake/presentation/auth/sign_up_page.dart';
import 'package:shabake/presentation/home/home_page.dart';
import 'package:shabake/router/route_constants.dart';


class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case opportunitiesRoute:
        return MaterialPageRoute(builder: (_) => OpportunitiesPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
