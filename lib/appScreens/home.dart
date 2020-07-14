import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udacity/appScreens/compoundInterest.dart';
import 'package:udacity/appScreens/simpleInterest.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interest Calculator',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0b132b),
            title: Center(
              child: Text(
                'Interest  Calculator',
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 4.0),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
              colors: [Color(0xffc4fff9), Color(0xffffffff)],
              radius: 1.5,
              focal: Alignment.topCenter,
            )),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(left: 60.0, top: 180.0, right: 60.0),
              child: ListView(
                children: <Widget>[
                  RaisedButton(
                    color: Color(0xff0b132b),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SimpleInterest();
                      }));
                    },
                    child: Text(
                      'Simple Interest Calculator',
                      style: TextStyle(
                        color: Color(0xffc4fff9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                  ),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CompoundInterest();
                      }));
                    },
                    child: Text(
                      'Compound Interest Calculator',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0b132b),
                      ),
                    ),
                  ),


                  Container(
                    height: 40.0,
                  ),
                  Image.asset("images/graph.png",
                  height: 240.0,)
                ],
              ),
            )),
          )),
    );
  }
}
