import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import 'mainPager/mainPager.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  Location location = new Location();
  onDoneLoading() async {
    bool enabledService = await location.serviceEnabled();
    if (enabledService) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      location.requestService().then((service) {
        if (service) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPage()));
        } else {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromRGBO(116, 189, 242, 1.0),
          image: DecorationImage(
              image: AssetImage(
                'assets/logo with text.png',
              ),
              fit: BoxFit.contain)),
    );
  }
}
