import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:tabdeel/frontend/loginAndRegister/login.dart';
import 'package:tabdeel/frontend/mainPager/second_page.dart';

import 'first_page.dart';
import 'third_page.dart';


class MainPage extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<MainPage> {
  static PageController controller =
      new PageController(initialPage: 1, keepPage: false);
  static List<Widget> pages = [FirstPage(), SecondPage(), ThirdPage()];
  static int page = 1;
  PageView pageView = new PageView(
    onPageChanged: (pageNumber) {
      page = pageNumber;
      print('PageNumber:' + pageNumber.toString());
    },
    scrollDirection: Axis.horizontal,
    controller: controller,
    children: pages,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            color: Color.fromRGBO(116, 189, 242, 1.0),
            child: Stack(
              children: <Widget>[
                Align(
                    child: PageIndicatorContainer(
                  pageView: pageView,
                  align: IndicatorAlign.bottom,
                  length: 3,
                  indicatorSpace: 10.0,

                  padding: EdgeInsets.fromLTRB(10, 0, 10, 100),
                  indicatorColor: Colors.white,
                  indicatorSelectorColor: Colors.yellow,
                  shape: IndicatorShape.circle(size: 12),
                  // shape: IndicatorShape.roundRectangleShape(size: Size.square(12),cornerSize: Size.square(3)),
                  // shape: IndicatorShape.oval(size: Size(12, 8)),
                )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: 150,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              color: Colors.white,
                              textColor: Color.fromRGBO(116, 189, 242, 1.0),
                              child: Text(
                                'التالي',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                /*
                  if (page == 1) {
                    controller.nextPage(
                        duration: Duration(seconds: 1), curve: Curves.ease);
                  } else {
                    controller.previousPage(
                        duration: Duration(seconds: 1), curve: Curves.ease);
                  }*/
                              },
                            ),
                          ),
                          InkWell(
                            child: Text(
                              'تخطي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  fontSize: 15),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}
