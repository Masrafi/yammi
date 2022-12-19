import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'delay.dart';
import 'doi/doi_page.dart';
import 'drawer/jogajok.dart';
import 'drawer/kreMotamot.dart';
import 'drawer/motamot_desktop.dart';
import 'google_sign.dart';
import 'kacagolla/kacagolla_page.dart';
import 'order/order.dart';
import 'rosomalai/rosomalai.dart';
import 'rosomunjuri/rosomunjuri_page.dart';

class HomeContentMobile extends StatefulWidget {
  @override
  _HomeContentMobileState createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile>
    with TickerProviderStateMixin {
  TabController _tabController;
  final int delayedAmount = 100;

  signOut() {
    googleSignIn.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Mas()));
  }

  /*@override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }*/

  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    controller = AnimationController(
      duration: Duration(
        seconds: 4,
      ),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.red, end: Colors.white)
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
      //backgroundColor: animation.value,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0.0,
        centerTitle: true,
        title: DelayedAnimation(
          child: Text(
            'ইয়াম্মী',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 18.0,
            ),
          ),
          delay: delayedAmount + 1000,
        ),
        actions: <Widget>[
          DelayedAnimation(
            child: IconButton(
              icon: Icon(
                Icons.notifications_none,
              ),
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>MessagingWidget()));
              },
            ),
            delay: delayedAmount + 1000,
          ),
          /* IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),*/
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //Image.asset('assets/doi5.jpg'),
            Container(
              height: 200,
              color: Colors.pink,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    child: Text('masrafianam@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onTap: () async {
                      const url =
                          'mailto:masrafianam@gmail.com?subject=Yammi&body=test%20body';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Text('01717374348',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onTap: () async {
                      const url = 'tel:01717374348';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              title: Text('মতামত দিন'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MotamotDesktop()));
              },
              leading: Icon(Icons.edit),
            ),
            ListTile(
              title: Text('ক্রেতা মূল্যায়ন'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KreMotamot()));
              },
              leading: Icon(Icons.comment),
            ),
            ListTile(
              title: Text('যোগাযোগ'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Jogajok()));
              },
              leading: Icon(Icons.call),
            ),
            ListTile(
              title: Text('ওয়েবসাইট'),
              onTap: () async {
                var url = 'https://yammy-60efb.firebaseapp.com/#/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: Icon(Icons.web),
            ),
            Divider(
              height: 20.0,
            ),
            ListTile(
              title: Text('প্রস্থান'),
              onTap: () {
                signOut();
              },
              leading: Icon(Icons.backspace),
            ),

            Divider(
              height: 20.0,
            ),
            ListTile(
              title: Text('বাতিল'),
              trailing: Icon(Icons.close, color: Colors.red),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          DelayedAnimation(
            child: Text(
              'পণ্য তালিকা',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            delay: delayedAmount + 1500,
          ),
          SizedBox(height: 15.0),
          DelayedAnimation(
            child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                //labelColor: Color(0xFFC88D67),
                labelColor: Colors.blue,
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45.0),
                unselectedLabelColor: Color(0xFFCDCDCD),
                tabs: [
                  Tab(
                    child: Text('দই_বগুড়া',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                        )),
                  ),
                  Tab(
                    child: Text('রসমঞ্জরী_গাইবান্ধা',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                        )),
                  ),
                  Tab(
                    child: Text('কাঁচাগোল্লা_নাটোর',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                        )),
                  ),
                  Tab(
                    child: Text('রসমালাই_কুমিল্লা',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                        )),
                  )
                ]),
            delay: delayedAmount + 2000,
          ),
          DelayedAnimation(
            child: Container(
                //color: animation.value,
                height: MediaQuery.of(context).size.height - 50.0,
                width: double.infinity,
                child: TabBarView(controller: _tabController, children: [
                  Doi(),
                  Rosomunjuri(),
                  Kacagolla(),
                  Rosomalai(),
                ])),
            delay: delayedAmount + 2500,
          ),
        ],
      ),
    );
  }
}
