import 'package:flutter/material.dart';

class CookieDetailDesktop extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  CookieDetailDesktop({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('দই',
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
                  'দই একটা সুস্বাদু দুগ্ধজাত খাবার, যেটা উৎপন্ন হয় গাভীর দুধ এবং চিনির সংমিশ্রণ থেকে।। ‘দই’ একটা সাধারণ খাদ্য পণ্য, কিন্তু ‘বগুড়ার দই’ ই হচ্ছে গুণগত মানে এবং স্বাদে সবার সেরা। সারা দেশে এটা ‘বগুড়ার দই’ নামেই পরিচিত। আমরা আপনাকে দিবো ১০০% বগুড়ার দই যেটা গুনে মানে অন্য সবার থেকে সেরা। আমাদের এখানে দই কিনলে আমরা দুই দিনের ভিতর বাসার ঠিকানায় পাঠায়ে দেই। আপনার জন্য থাকছে দই পাওয়ার পড় টাকা পরিশোধ করার সুজক।',
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
