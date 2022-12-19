import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KreMotamotDesktop extends StatefulWidget {
  @override
  _KreMotamotDesktopState createState() => _KreMotamotDesktopState();
}

class _KreMotamotDesktopState extends State<KreMotamotDesktop> {
  getDriversList() async {
    return await Firestore.instance.collection('motamot').getDocuments();
  }

  QuerySnapshot querySnapshot;
  @override
  void initState() {
    super.initState();
    getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  Widget _showDrivers() {
    if (querySnapshot != null) {
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot.documents.length,
        padding: EdgeInsets.all(12.0),
        itemBuilder: (context, i) {
          return Center(
            child: Card(
              elevation: 10,
              shadowColor: Colors.black,
              child: Container(
                  width: 600,
                  height: 150,
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                '${querySnapshot.documents[i].data['photoURL']}'),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${querySnapshot.documents[i].data['DisplayName']}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('${querySnapshot.documents[i].data['Name']}')
                    ],
                  )),
            ),
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
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
        body: _showDrivers());
  }
}
