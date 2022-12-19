import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:uuid/uuid.dart';

import '../google_sign.dart';
import 'button.dart';

class OrderDesktop extends StatefulWidget {
  @override
  _OrderDesktopState createState() => _OrderDesktopState();
}

class _OrderDesktopState extends State<OrderDesktop> {
  var _namer = new TextEditingController();
  var _phoneNumber = new TextEditingController();
  var _place = new TextEditingController();
  var _road = new TextEditingController();
  var _house = new TextEditingController();
  var _poriman = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool showSpinner = false;
  String email;
  String password;
  String postId = Uuid().v4();
  final userRef2 = Firestore.instance.collection('orderDesktop');
  bool isUploading = false;
  String _ponnoName;

  creatPost1({
    String nameM,
    String ponnoNameM,
    String porimanM,
    String proneM,
    String placeM,
    String roadM,
    String houseM,
  }) {
    userRef2
        .document(currentUser.id)
        .collection('desktop')
        .document(postId)
        .setData({
      'Name': nameM,
      "Porni Name": ponnoNameM,
      "Poriman": porimanM,
      'PhoneNumber': proneM,
      'PlaceName': placeM,
      'RoadNumber': roadM,
      'HouseNumber': houseM
    });
  }

  submit() async {
    setState(() {
      isUploading = true;
    });
    creatPost1(
      nameM: _namer.text,
      ponnoNameM: _ponnoName,
      porimanM: _poriman.text,
      proneM: _phoneNumber.text,
      placeM: _place.text,
      roadM: _road.text,
      houseM: _house.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Text('           ')],
        backgroundColor: Colors.pink,
        title: Center(
            child: Text(
          'ইয়াম্মী',
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 400.0),
          child: Form(
            key: _formKey,
            //autovalidate: true,
            child: ListView(children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text('আপনার নাম'),
              TextFormField(
                //obscureText: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                controller: _namer,

                validator: (val) {
                  if (val.isEmpty) {
                    return 'আপনি নাম দেননি';
                  } else {}
                },
                decoration: InputDecoration(
                  hintText: 'এখানে আপনার নাম লিখেন',
                  // icon: Icon(Icons.location_on),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  //labelText: 'Route From',
                  // icon: Icon(Icons.location_on),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Text('তালিকা'),
              DropdownButtonFormField<String>(
                isExpanded: true,
                items: [
                  DropdownMenuItem<String>(
                    child: Text('দই'),
                    value: 'দই',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('রসমঞ্জরী'),
                    value: 'রসমঞ্জরী',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('কাঁচাগোল্লা'),
                    value: 'কাঁচাগোল্লা',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('রসমালাই'),
                    value: 'রসমালাই',
                  ),
                ],
                onChanged: (String value) {
                  setState(() {
                    _ponnoName = value;
                  });
                },
                validator: (_ponnoName) =>
                    _ponnoName == null ? 'পণ্য তালিকা নির্বাচন করুন' : null,
                hint: Text('পণ্য তালিকা'),
                value: _ponnoName,
              ),

              SizedBox(
                height: 20,
              ),
              Text('পরিমান'),
              TextFormField(
                //obscureText: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                controller: _poriman,

                validator: (val) {
                  if (val.isEmpty) {
                    return 'আপনি পরিমান দেননি';
                  } else {}
                },
                decoration: InputDecoration(
                  hintText: 'কতো টুক নেবেন',
                  // icon: Icon(Icons.location_on),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Text('মুবাইল নাম্বার'),
              TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: _phoneNumber,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'আপনি নাম্বার লিখেননি';
                  } else if (val.trim().length < 11) {
                    return 'আপনি সংখ্যা কম দিছেন';
                  } else if (val.trim().length > 11) {
                    return 'আপনি সংখ্যা বেশি দিছেন';
                  } else {}
                },
                //onSaved: (val) => userphone = val,
                decoration: InputDecoration(
                  hintText: 'এখানে নাম্বার লিখেন',
                  // icon: Icon(Icons.location_on),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  //labelText: 'Route From',
                  // icon: Icon(Icons.location_on),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Text('ঠিকানা'),
              TextFormField(
                //obscureText: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                controller: _place,

                validator: (val) {
                  if (val.isEmpty) {
                    return 'আপনি ঠিকানা দেননি';
                  } else {}
                },
                decoration: InputDecoration(
                  hintText: 'এখানে ঠিকানা লিখেন',
                  // icon: Icon(Icons.location_on),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              //  Divider(thickness: 1.0,color: Colors.black),
              Text('রাস্থা'),
              TextFormField(
                //obscureText: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                controller: _road,

                validator: (val) {
                  if (val.isEmpty) {
                    return 'আপনি রাস্থা নাম্বার দেননি';
                  } else {}
                },
                decoration: InputDecoration(
                  hintText: 'এখানে রুস্থা নাম্বার লিখেন',
                  // icon: Icon(Icons.location_on),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('বাড়ি নাম্বার'),
              TextFormField(
                //obscureText: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                controller: _house,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'আপনি বাড়ি নাম্বার দেননি';
                  } else {}
                },
                decoration: InputDecoration(
                  hintText: 'এখানে বাড়ি নাম্বার লিখেন',
                  // icon: Icon(Icons.location_on),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showSpinner = true;
                    });
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      submit();
                      Navigator.pop(context);
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  },
                  child: Container(
                    height: 50.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink,
                    ),
                    child: Center(
                      child: Text(
                        'জমা দিন',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
