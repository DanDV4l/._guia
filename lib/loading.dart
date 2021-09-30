import 'package:flutter/material.dart';
import 'package:ponto_guia/main.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: sheight,
        width: swidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/logodark.png',
              width: 200,
              height: 200,
            ),
            Text('AGUARDE\n',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Container(
              height: 3,
              width: 150,
              child: LinearProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
