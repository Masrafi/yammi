import 'package:flutter/material.dart';
import 'package:yammi/order/order.dart';
import 'package:yammi/rosomalai/rosomalai_details.dart';

class RosomalaiDesktop extends StatefulWidget {
  @override
  _RosomalaiDesktopState createState() => _RosomalaiDesktopState();
}

class _RosomalaiDesktopState extends State<RosomalaiDesktop>
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
              //width: MediaQuery.of(context).size.width - 50.0,
              //height: MediaQuery.of(context).size.height - 70.0,
              height: 500,
              width: 200,
              child:
                  /*GridView.count(
                crossAxisCount: 3,
                primary: false,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Cookie mint', '\$3.99', 'assets/cookiemint.jpg'
                      , context),
                  _buildCard('Cookie cream', '\$5.99', 'assets/cookiecream.jpg',
                      context),
                  _buildCard('Cookie classic', '\$1.99',
                      'assets/cookieclassic.jpg', context),
                  _buildCard('Cookie choco', '\$2.99', 'assets/cookiechoco.jpg', context),


                  SizedBox(height: 50.0)

                ],
              ),*/
                  ListView(
                children: [
                  Center(
                    child: Wrap(
                      spacing: 3,
                      //direction: Axis.vertical,
                      children: [
                        _buildCard(
                            '৫০০ গ্রাম', '\৳১৫০', 'assets/rosma1.jpg', context),
                        _buildCard(
                            '১ কেজি', '\৳৩০০', 'assets/rosma2.jpg', context),
                        _buildCard(
                            '১.৫ কেজি', '\৳৪৫০', 'assets/rosma3.jpg', context),
                        _buildCard(
                            '২ কেজি', '\৳৬০০', 'assets/rosma4.jpg', context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 350, left: 350),
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.pink,
                      icon: Icon(Icons.add),
                      label: Text('নিশ্চিত করুন'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Order()));
                      },
                    ),
                  ),
                ],
              )),
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
                height: 300,
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: animation.value),
                child: Column(children: [
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 250.0,
                          width: 200.0,
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
                  /*Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ]
                          ]))*/
                ]))));
  }
}
