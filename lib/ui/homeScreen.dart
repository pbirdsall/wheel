import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:wheel/ui/widgets/eggTimerDial.dart';

final Color GRADIENT_TOP = const Color(0xFF0505F5);
final Color GRADIENT_BOTTOM = const Color(0xFF1818E8);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() =>  _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GDG / Flutter NYC Spinner", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation:
        Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              children: <Widget>[

                //Outer Circle
                Container(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Container(
                            decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: new LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [GRADIENT_TOP, GRADIENT_BOTTOM],

                            ),
                              boxShadow: [
                                new BoxShadow(
                                  color: const Color(0x44000000),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: const Offset(0.0, 1.0),
                                ),
                              ],
                          ),

                            child:
                              EggTimerDial(),

                          ),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}