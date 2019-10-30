import 'package:flutter/material.dart';
import 'package:tabdeel/frontend/appPages/home/home_page.dart';
import 'package:tabdeel/frontend/loginAndRegister/signup.dart';

import 'frontend/appPages/stores/stores.dart';
import 'frontend/loginAndRegister/login.dart';
import 'frontend/splash.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Splash(),
    theme: ThemeData(
        fontFamily: 'jareda',
        unselectedWidgetColor: Colors.white,
        canvasColor: Colors.white),
  ));
}
