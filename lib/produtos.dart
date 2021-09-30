import 'package:flutter/material.dart';
import 'package:ponto_guia/pages/plistaprodutos.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/loading.dart';
import 'package:ponto_guia/main.dart';
import 'package:ponto_guia/pages/plistalojas.dart';

class Produtoss extends StatefulWidget {
  const Produtoss({Key? key}) : super(key: key);

  @override
  _ProdutossState createState() => _ProdutossState();
}

class _ProdutossState extends State<Produtoss> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: produtosAPI(produtoID),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingScreen();
            case ConnectionState.done:
              apiProdutos = snapshot.data;
              return ListaProdutos();
            case ConnectionState.active:
              return LoadingScreen();
            case ConnectionState.none:
              return LoadingScreen();
          }
        });
  }
}
