import 'package:flutter/material.dart';

class KacagollaDetailDesktop extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  KacagollaDetailDesktop({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('কাঁচাগোল্লা',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 15.0),
        Hero(
            tag: assetPath,
            child: Image.asset(assetPath,
                height: 350.0, width: 250.0, fit: BoxFit.contain)),
        SizedBox(height: 20.0),
        Center(
          child: Text(cookieprice,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(cookiename,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: Text(
                  'নাটোরের পানি মূলত কাঁচাগোল্লা তৈরির জন্য আদর্শ। বললেন, নাটোরের বিভিন্ন স্থানে অল্প স্রোতের অসংখ্য খাল ছিল। কাপড়ে বেঁধে দুধের তৈরি ছানা ওই সব খালের পানির ভেতর ডুবিয়ে রাখা হতো। সকালে তুলে সব পানি বের করে দেওয়া হতো। ওই ছানা থেকেই তৈরি হতো কাঁচাগোল্লা।',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFF585858))),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ]),
    );
  }
}
