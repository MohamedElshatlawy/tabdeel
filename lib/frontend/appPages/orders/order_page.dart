import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int openPageDetails = 0;
  int openChatAndRate=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
        textDirection: TextDirection.rtl,
        child: (openPageDetails == 0)
            ? ListView(
                children: <Widget>[
                  ListTile(
                    onTap: (){
                      setState(() {
                        openPageDetails=1;
                      });
                    },
                      leading: Image.asset('assets/product.png'),
                      title: Text(
                        'لاب توب ديل 6565',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            color: Colors.black54,
                            size: 15,
                          ),
                          Text(
                            ' تاريخ التسليم المتوقع:25-9-2019',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          )
                        ],
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.directions_car,
                                color: Colors.black54,
                                size: 15,
                              ),
                              Text(
                                ' تم شحنها',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: Colors.black54,
                                size: 15,
                              ),
                              Text(
                                ' محمد مصطفى',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 11),
                              )
                            ],
                          ),
                        ],
                      )),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                      leading: Image.asset('assets/product.png'),
                      title: Text(
                        'لاب توب ديل 6565',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            color: Colors.black54,
                            size: 15,
                          ),
                          Text(
                            ' تاريخ التسليم المتوقع:25-9-2019',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          )
                        ],
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.directions_car,
                                color: Colors.black54,
                                size: 15,
                              ),
                              Text(
                                ' بانتظار المندوب',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: Colors.black54,
                                size: 15,
                              ),
                              Text(
                                ' محمد مصطفى',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 11),
                              )
                            ],
                          ),
                        ],
                      )),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                      leading: Image.asset('assets/product.png'),
                      title: Text(
                        'لاب توب ديل 6565',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            color: Colors.black54,
                            size: 15,
                          ),
                          Text(
                            ' تاريخ التسليم المتوقع:25-9-2019',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          )
                        ],
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.directions_car,
                                color: Colors.black54,
                                size: 15,
                              ),
                              Text(
                                ' تم توصيلها',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: Colors.black54,
                                size: 15,
                              ),
                              Text(
                                ' محمد مصطفى',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 11),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              )
            : OrderPageDetails());
  
  }
}

class OrderPageDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderPageDetails> {
  int openChat=0;
  int current_step = 0;
  List<Step> my_steps = [
    Step(
        // Title of the Step
        title: Text(
          "بانتظار المندوب",
          style: TextStyle(
              color: Color.fromRGBO(116, 189, 242, 1.0), fontSize: 10),
        ),
        // Content, it can be any widget here. Using basic Text for this example
        content: Text('data'),
        state: StepState.complete,
        isActive: true),
    Step(
        title: Text("جاري توصيلها",
            style: TextStyle(color: Colors.grey, fontSize: 10)),
        content: Container(),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.complete,
        isActive: false),
    Step(
        title: Text("تم توصيلها",
            style: TextStyle(color: Colors.grey, fontSize: 10)),
        content: Container(),
        state: StepState.complete,
        isActive: false),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              child: Stepper(
                type: StepperType.horizontal,
                steps: my_steps,
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Container();
                },
              ),
            ),
            ListTile(
                leading: Image.asset('assets/product.png'),
                title: Text(
                  'لاب توب ديل 6565',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      color: Colors.black54,
                      size: 15,
                    ),
                    Text(
                      ' تاريخ التسليم المتوقع:25-9-2019',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    )
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.black54,
                          size: 15,
                        ),
                        Text(
                          ' بانتظار المندوب',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Colors.black54,
                          size: 15,
                        ),
                        Text(
                          ' محمد مصطفى',
                          style: TextStyle(color: Colors.black54, fontSize: 11),
                        )
                      ],
                    ),
                  ],
                )),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 130,
                  child: RaisedButton(
                    child: Text('مراسلة المندوب'),
                    onPressed: () {
                      setState(() {
                        openChat=1;
                      });
                    },
                    textColor: Colors.white,
                    color: Color.fromRGBO(116, 189, 242, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
                Container(
                  width: 130,
                  child: RaisedButton(
                    child: Text('الابلاغ عن مشكلة'),
                    onPressed: () {
                      setState(() {
                        openChat=2;
                      });
                    },
                    textColor: Colors.white,
                    color: Color.fromRGBO(116, 189, 242, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: (openChat==2)?RateWidget():(openChat==1)?chatWidget():
                Container(),
              ),
            )
        
        
          ],
        ));
  }
}

class chatWidget extends StatefulWidget {
  @override
  _chatWidgetState createState() => _chatWidgetState();
}

class _chatWidgetState extends State<chatWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 4,
              child: ListView(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[300]),
                        child: Text(
                          'السلام عليكم ورحمة الله وبركاته',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[300]),
                        child: Text(
                          'وعليكم السلام ورحمة الله',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[300]),
                        child: Text(
                          'السلام عليكم ورحمة الله وبركاته',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[300]),
                        child: Text(
                          'وعليكم السلام ورحمة الله',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[300]),
                        child: Text(
                          'السلام عليكم ورحمة الله وبركاته',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[300]),
                        child: Text(
                          'وعليكم السلام ورحمة الله',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            flex: 4,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'اكتب رسالتك',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.all(10),
                                  border: InputBorder.none),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.mic,
                                    color: Colors.black87,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.send,
                                    color: Color.fromRGBO(116, 189, 242, 1.0),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class RateWidget extends StatefulWidget {
  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'وضع تقييم للمندوب',
                style: TextStyle(color: Colors.grey),
              ),
              SmoothStarRating(
                  allowHalfRating: false,
                  starCount: 5,
                  rating: 1.5,
                  size: 27.0,
                  color: Color.fromRGBO(116, 189, 242, 1.0),
                  borderColor: Color.fromRGBO(116, 189, 242, 1.0),
                  spacing: 0.0),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                border: InputBorder.none,
                hintText: 'كتابة تقييم',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Color.fromRGBO(116, 189, 242, 1.0),
            child: Text('وضع تقييم'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
