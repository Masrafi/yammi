import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:uuid/uuid.dart';

import '../google_sign.dart';

class MotamotDesktop extends StatefulWidget {
  @override
  _MotamotDesktopState createState() => _MotamotDesktopState();
}

class _MotamotDesktopState extends State<MotamotDesktop> {
  var _motamotController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  String postId = Uuid().v4();
  final userRef = Firestore.instance.collection('motamot');
  bool isUploading = false;

  creatPost({
    String nameM,
  }) {
    userRef.document(currentUser.id)
      ..setData({
        'Name': nameM,
        "DisplayName": currentUser.displayName,
        "photoURL": currentUser.photoUrl
      });
  }

  submit() async {
    setState(() {
      isUploading = true;
    });
    creatPost(
      nameM: _motamotController.text,
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
        child: Container(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: _formKey,
            //autovalidate: true,
            child: Column(
              children: [
                Center(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _motamotController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'আপনি কিছু লিখেননি... ';
                      } else {}
                    },
                    decoration: InputDecoration(
                        // icon: Icon(Icons.location_on),
                        border: OutlineInputBorder(),
                        labelText: 'আপনার ক্রয় করা পণ্যের মান কেমন ছিল',
                        // icon: Icon(Icons.location_on),
                        hintText: 'লিখুন... ',
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        )),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showSpinner = true;
                      });
                      if (_formKey.currentState.validate()) {
                        submit();
                        Navigator.pop(context);
                        setState(() {
                          showSpinner = false;
                        });
                        // If the form is valid, display a Snackbar.

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
