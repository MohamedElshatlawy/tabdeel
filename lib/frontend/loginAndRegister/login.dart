import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tabdeel/backend/Users/Model/client_model.dart';
import 'package:tabdeel/backend/Users/userAuthentication/client_auth.dart';
import 'package:tabdeel/backend/Users/userAuthentication/driver_auth.dart';
import 'package:tabdeel/backend/Users/userAuthentication/shop_auth.dart';
import 'package:tabdeel/frontend/appPages/home/home_page.dart';
import 'package:tabdeel/frontend/loginAndRegister/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mobController = TextEditingController();
  var passController = TextEditingController();

  var radioValue = 1;
  bool connectionEnded = false;
  final scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
        body: Container(
            color: Color.fromRGBO(116, 189, 242, 1.0),
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/logo with text.png'),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: mobController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'رقم التليفون',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  icon: Icon(
                                    Icons.phone_android,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: passController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  hintText: 'كلمة المرور',
                                  icon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'نوع الحساب',
                              style: TextStyle(color: Colors.white),
                            ),
                            Radio(
                              groupValue: radioValue,
                              onChanged: (val) {
                                setState(() {
                                  radioValue = val;
                                });
                              },
                              value: 1,
                              activeColor: Colors.yellow,
                            ),
                            Text('عميل', style: TextStyle(color: Colors.white)),
                            Radio(
                              groupValue: radioValue,
                              onChanged: (val) {
                                setState(() {
                                  radioValue = val;
                                });
                              },
                              value: 2,
                              activeColor: Colors.yellow,
                            ),
                            Text('محل', style: TextStyle(color: Colors.white)),
                            Radio(
                              groupValue: radioValue,
                              onChanged: (val) {
                                setState(() {
                                  radioValue = val;
                                });
                              },
                              value: 3,
                              activeColor: Colors.yellow,
                            ),
                            Text('مندوب', style: TextStyle(color: Colors.white))
                          ],
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(90, 0, 90, 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(
                        'دخول',
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        setState(() {
                          connectionEnded = true;
                        });
                        _loginUser(radioValue, mobController.text,
                                passController.text)
                            .then((response) {
                          print("DoneRequestLOgin:${response.body.toString()}");
                            switch (radioValue) {
                            case 1:
                              var resBody = jsonDecode(response.body);
                              if (resBody['success'] == 1) {
                                ClientModel clientModel =
                                    ClientModel.fromMap(resBody);

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(clientModel)));
                              } else {
                                showSnackBar(resBody['message']);
                                                              }
                                
                                                              break;
                                                            default:
                                                          }
                                
                                                        }).catchError((error) {
                                                          print('ErrorLoginRequest:$error');
                                                        }).whenComplete(() {
                                                          setState(() {
                                                            connectionEnded = false;
                                                          });
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.fromLTRB(60, 0, 60, 10),
                                                      child: InkWell(
                                                        child: Text(
                                                          'لا تمتلك حساب سجل الان',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              decoration: TextDecoration.underline),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext ctx) => SignUp()));
                                                        },
                                                      )),
                                                  (connectionEnded == false)
                                                      ? Container()
                                                      : Center(
                                                          child: CircularProgressIndicator(
                                                              backgroundColor:
                                                                  Color.fromRGBO(116, 189, 242, 1.0),
                                                              valueColor: new AlwaysStoppedAnimation<Color>(
                                                                  Colors.white)),
                                                        )
                                                ],
                                              ),
                                            )));
                                  }
                                
                                  Future<http.Response> _loginUser(
                                      int radioValue, String phone, String password) async {
                                    switch (radioValue) {
                                      case 1:
                                      print('Client');
                                        return await loginClient(phone, password);
                                        break;
                                      case 2:
                                      print('Shop');
                                        return await loginShop(phone, password);
                                        break;
                                      default:
                                      print('driver');
                                        return await loginDriver(phone, password);
                                    }
                                  }
                                
                                   void showSnackBar(String msg) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
