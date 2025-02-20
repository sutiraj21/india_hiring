import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inidiahiringg/View/OnBoarding_Screen.dart';
import 'package:inidiahiringg/View/Profile_Setup.dart';

import '../../View/Splash_Screen.dart';
import '../../view/Login_screen.dart';
import 'Routes_Name.dart';

class Routes {

  static Route<dynamic>  generateRoutes(RouteSettings settings){


    switch(settings.name){


      case  RoutesName.login:

        return MaterialPageRoute(builder: (BuildContext context )=> LoginScreen()) ;

      case  RoutesName.profilesetup:

        return MaterialPageRoute(builder: (BuildContext context )=>ProfileSetupScreen()) ;

      case RoutesName.splash:

        return MaterialPageRoute(builder: (BuildContext context)=>SplashScreen());

      case RoutesName.onboard:

        return MaterialPageRoute(builder: (BuildContext context)=>OnboardingScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(child: Text("No Route Defined"),),
          );
        });
    }
  }
}