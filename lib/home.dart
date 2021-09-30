import 'package:flutter/material.dart';
import 'package:ponto_guia/main.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/loading.dart';
import 'package:ponto_guia/pages/phome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    contextvar = context;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    swidth = _width;
    sheight = _height;
    //print('O tamanho inicial: $_width');

    return SafeArea(
        child: FutureBuilder(
      future: dadosLojas(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return LoadingScreen();
          case ConnectionState.done:
            apiLojas = snapshot.data;
            return PHome();
          case ConnectionState.active:
            return LoadingScreen();
          case ConnectionState.none:
            return LoadingScreen();
        }
      },
    ));
  }
}
