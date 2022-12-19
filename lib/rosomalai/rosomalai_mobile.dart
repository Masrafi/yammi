import 'package:flutter/material.dart';
import 'package:yammi/order/order.dart';
import 'package:yammi/rosomalai/rosomalai_details.dart';

class RosomalaiMobile extends StatefulWidget {
  @override
  _RosomalaiMobileState createState() => _RosomalaiMobileState();
}

class _RosomalaiMobileState extends State<RosomalaiMobile>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blue, end: Colors.white)
        .animate(controller); //background color change hbe. animation
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard(
                      '৫০০ গ্রাম', '\৳১৫০', 'assets/rosma1.jpg', context),
                  _buildCard('১ কেজি', '\৳৩০০', 'assets/rosma2.jpg', context),
                  _buildCard('১.৫ কেজি', '\৳৪৫০', 'assets/rosma3.jpg', context),
                  _buildCard('২ কেজি', '\৳৬০০', 'assets/rosma4.jpg', context),
                ],
              )),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(right: 50, left: 50),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.add),
              label: Text('নিশ্চিত করুন'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Order()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RosomalaiDetails(
                      assetPath: imgPath,
                      cookieprice: price,
                      cookiename: name)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: animation.value),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                          tag: imgPath,
                          child: Container(
                              height: 140.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(imgPath),
                                      fit: BoxFit.contain)))),
                      SizedBox(height: 7.0),
                      Text(price,
                          style: TextStyle(
                              color: Color(0xFFCC8053),
                              fontFamily: 'Varela',
                              fontSize: 14.0)),
                      Text(name,
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Varela',
                              fontSize: 14.0)),
                    ]))));
  }
}
