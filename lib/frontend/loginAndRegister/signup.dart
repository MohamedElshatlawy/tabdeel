import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:tabdeel/backend/Users/Model/client_model.dart';
import 'package:tabdeel/backend/Users/Model/driver_model.dart';
import 'package:tabdeel/backend/Users/Model/shop_model.dart';
import 'package:tabdeel/backend/Users/userAuthentication/client_auth.dart';
import 'package:tabdeel/backend/Users/userAuthentication/driver_auth.dart';
import 'package:tabdeel/backend/Users/userAuthentication/shop_auth.dart';
import 'package:tabdeel/frontend/appPages/home/home_page.dart';
import 'package:tabdeel/frontend/loginAndRegister/shopWidget.dart';

import 'package:device_id/device_id.dart';

import 'mandoob.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var radioValue = 1;
  bool checkboxVal = false;
  bool connectionEnded = false;

  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();
  File _image;

  var shopNameController = TextEditingController();
  var commericalRecordController = TextEditingController();
  StringBuffer subscribeRadioVal = new StringBuffer("month");

  StringBuffer nationalityID = new StringBuffer();
  var numberID = TextEditingController();
  StringBuffer imgIDPath = new StringBuffer();
  StringBuffer imgLicensePath = new StringBuffer();
  StringBuffer imgFrontCarPath = new StringBuffer();
  StringBuffer imgRearCarPath = new StringBuffer();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  var location = new Location();
  Future<LocationData> _getLocation() async {
    return location.getLocation();
  }

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: scaffoldKey,
        body: Container(
            color: Color.fromRGBO(116, 189, 242, 1.0),
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                      width: 200,
                      height: 200,
                      child: InkWell(
                          onTap: () {
                            getImage();
                          },
                          child: (_image == null)
                              ? Icon(
                                  Icons.account_circle,
                                  size: 170,
                                  color: Colors.white,
                                )
                              : Image.file(_image))),
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
                            child: TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(color: Colors.teal),
                                  border: InputBorder.none,
                                  hintText: 'الاسم',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  icon: Icon(
                                    Icons.person,
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
                            child: TextFormField(
                              controller: mailController,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "ادخل البريد الألكتروني";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  hintText: 'البريد الألكتروني',
                                  icon: Icon(
                                    Icons.alternate_email,
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
                            child: TextFormField(
                              controller: passController,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "ادخل كلمة المرور";
                                }
                                return null;
                              },
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
                            child: TextFormField(
                              controller: phoneController,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "ادخل رقم التليفون";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  hintText: 'رقم التليفون',
                                  icon: Icon(
                                    Icons.phone_android,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //RadioBtns
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
                      margin: (radioValue == 2)
                          ? EdgeInsets.fromLTRB(50, 0, 50, 0)
                          : EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: (radioValue == 1)
                          ? Container()
                          : (radioValue == 2)
                              ? Shop(shopNameController,
                                  commericalRecordController, subscribeRadioVal)
                              : Driver(
                                  nationalityID,
                                  numberID,
                                  imgIDPath,
                                  imgLicensePath,
                                  imgFrontCarPath,
                                  imgRearCarPath)),

                  Container(
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              value: checkboxVal,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (val) {
                                setState(() {
                                  checkboxVal = val;
                                });
                              },
                            ),
                            Text(
                              'بالنقر على هذا الزر اكون وافقت على ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'شروط التطبيق',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        )),
                  ),

                  //RegButton
                  Container(
                    margin: EdgeInsets.fromLTRB(90, 0, 90, 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(
                        'تسجيل',
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () async {
                        /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext ctx) => HomePage()));

                                
                      */
                        setState(() {
                          connectionEnded = true;
                        });
                        _signupUser(radioValue).whenComplete(() {
                          setState(() {
                            connectionEnded = false;
                          });
                        }).then((response) {
                          print("DoneRequestSignUp:${response.body}");

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
                          print('ErrorSignUpRequest:$error');
                        });

                        print("Controller:${commericalRecordController.text}");
                        print("Controller:${nationalityID.toString()}");
                        print("RadioSelected:$subscribeRadioVal");
                        print("IMGID:${(imgIDPath.toString())}");
                        print("IMGLic:${(imgLicensePath.toString())}");
                      },
                    ),
                  ),

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

  Future<http.Response> _signupUser(int radioVal) async {
    String name = nameController.text;
    String pass = passController.text;
    String mail = mailController.text;
    String phone = phoneController.text;
    String deviceId = await DeviceId.getID;

    String img = "";
    await encodeImage(_image).then((im) {
      img = base64Encode(im);
    }); //USER-IMG

    String privacy = (checkboxVal == true) ? "1" : "0";
    String Lat = ""; //
    String Lng = "";

    await location.getLocation().then((currentLoc) {
      Lat = currentLoc.latitude.toString();
      Lng = currentLoc.longitude.toString();
    }).catchError((error) {
      print('LocationError:$error');
    }).whenComplete(() {
      print('InsideWhenComplete');
    });
    //

    switch (radioVal) {
      case 1:
        return registerClient(ClientModel(
            ClientLat: Lat, //
            ClientLon: Lng, //
            DeviceID: deviceId,
            email: mail,
            img: img, //
            mobile: phone,
            name: name,
            password: pass,
            privacy: privacy));
        break;

      case 2:
        //ExtraData for shop
        String shopName = shopNameController.text;
        String commericalRecord = commericalRecordController.text;
        String subType = subscribeRadioVal.toString();

        print('SHopName:$shopName');
        print("comm$commericalRecord");
        print('Subtype:$subType');
        return registerShop(ShopModel(
            commerical_record: commericalRecord,
            DeviceID: deviceId,
            email: mail,
            img: img,
            mobile: phone,
            name: name,
            password: pass,
            privacy: privacy,
            shop_name: shopName,
            subtype: (subType == "month") ? "0" : "1", //
            ShopLon: Lng,
            ShoptLat: Lat));

        break;

      default:
        //ExtraData forDriver
        String mynationalityID = this.nationalityID.toString();
        String idNumber = numberID.text;

        String imgID = ""; //
        await encodeImage(File(imgIDPath.toString())).then((im) {
          imgID = base64Encode(im);
        });

        String imgLic = ""; //
        await encodeImage(File(imgLicensePath.toString())).then((im) {
          imgLic = base64Encode(im);
        });

        String imgCarFront = ""; //
        await encodeImage(File(imgFrontCarPath.toString())).then((im) {
          imgCarFront = base64Encode(im);
        });

        String imgCarRear = ""; //
        await encodeImage(File(imgRearCarPath.toString())).then((im) {
          imgCarRear = base64Encode(im);
        });

        print("IdNumber:$idNumber");
        print("NAationality:$mynationalityID");
        return registerDriver(DriverModel(
            car_front_img: imgCarFront,
            car_rear_img: imgCarRear,
            DeviceID: deviceId,
            DriverLat: Lat,
            DriverLon: Lng,
            email: mail,
            id_img: imgID,
            id_number: idNumber,
            img: img,
            license_img: imgLic,
            mobile: phone,
            name: name,
            nationality: mynationalityID,
            password: pass,
            privacy: privacy));
    }
  }

  void showSnackBar(String msg) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}

Future<List<int>> encodeImage(File img) async {
  return await img.readAsBytes();
}
