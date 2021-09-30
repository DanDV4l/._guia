import 'package:flutter/material.dart';
import 'package:ponto_guia/obj.dart';
import 'package:ponto_guia/pages/plistalojas.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/loading.dart';

class ListaLojas extends StatefulWidget {
  @override
  _ListaLojasState createState() => _ListaLojasState();
}

class _ListaLojasState extends State<ListaLojas> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dadosLojas(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingScreen();
            case ConnectionState.done:
              return PListaLojas();
            case ConnectionState.active:
              return LoadingScreen();
            case ConnectionState.none:
              return LoadingScreen();
          }
        });
  }
}
