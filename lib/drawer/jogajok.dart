import 'package:flutter/material.dart';

class Jogajok extends StatefulWidget {
  @override
  _JogajokState createState() => _JogajokState();
}

class _JogajokState extends State<Jogajok> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text('           ')
        ],
        backgroundColor: Colors.pink,
        title: Center(child: Text('ইয়াম্মী', style: TextStyle(fontSize: 30),)),
      ),
      body: Center(
        child: Text("masrafianam@gmail.com",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),
        ),
      ),
    );
  }
}
