import 'package:flutter/material.dart';

class RosomunjuriDetailMobile extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  RosomunjuriDetailMobile({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('বিস্তারিত',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('রসমঞ্জরী',
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
                height: 200.0, width: 150.0, fit: BoxFit.contain)),
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
            child: Text(
                'রসমঞ্জরী। গাইবান্ধা জেলার বিখ্যাত ও ঐতিহ্যবাহী মিষ্টি। এ জেলার কাউকে যদি জিজ্ঞেস করা হয় গাইবান্ধা কিসের জন্য বিখ্যাত? উত্তর দেবে, রসমঞ্জরীর জন্য! স্বাদে, গুণে ও মানে অতুলনীয় গাইবান্ধার রসমঞ্জরী। না খেলে এর স্বাদ বোঝা সম্ভব নয়। রসমঞ্জরী প্রস্তুত করা হয় দুধ, ছানা, ক্ষীর ও চিনির মিশ্রণে। ছোট ছোট গোলাকার ছানার তৈরি মিষ্টিতে ঘন রস ব্যবহার করা হয় বলে একে রসমঞ্জরী নামে ডাকা হয়।',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFF424242))),
          ),
        ),
        SizedBox(height: 20.0),
      ]),
    );
  }
}
