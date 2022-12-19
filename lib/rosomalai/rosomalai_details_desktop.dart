import 'package:flutter/material.dart';

class RosomalaiDetailDesktop extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  RosomalaiDetailDesktop({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('রসমালাই',
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
                  'কুমিল্লার মাতৃভান্ডারের রসমলাই এর নাম শুনলেই জিভে জল এসে যায়। সুস্বাদু আর ঐতিহ্যবাহী এই মিষ্টান্নের যাত্রা শুরু হয়েছিল কুমিল্লা থেকেই। তাই আসল রসমলাইয়ের স্বাদ পেতে যেকোনো জায়গার হলে চলবে না, আসল স্বাদ পেতে হলে আসতে হবে কুমিল্লাতেই।,',
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
