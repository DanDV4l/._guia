import 'package:flutter/material.dart';
import 'package:ponto_guia/main.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/loading.dart';
import 'package:ponto_guia/pages/pParque.dart';

class Parque extends StatefulWidget {
  @override
  _ParqueState createState() => _ParqueState();
}

class _ParqueState extends State<Parque> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dadosParque(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingScreen();
            case ConnectionState.done:
              apiParque = snapshot.data;
              return PParque();
            case ConnectionState.active:
              return LoadingScreen();
            case ConnectionState.none:
              return LoadingScreen();
          }
        });
  }
}
