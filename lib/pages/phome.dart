import 'package:flutter/material.dart';
import 'package:ponto_guia/obj.dart';
import 'package:ponto_guia/parque.dart';
import 'package:ponto_guia/loading.dart';
import 'package:ponto_guia/produtos.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/lojas.dart';
import 'package:ponto_guia/main.dart';

class PHome extends StatefulWidget {
  PHome();
  @override
  _PHomeState createState() => _PHomeState();
}

class _PHomeState extends State<PHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: buildBody(
            [
              buildLiveBanner(bannerHomeAPI()),
              Divider(),
              buildHomeBar(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Parque(),
                  ),
                );
              }, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ListaLojas(),
                  ),
                );
              }),
              Text(
                'RECENTES',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    /*boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(2, 2))
                        ]*/
                  ),
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: apiLojas.length,
                      itemBuilder: (context, index) {
                        return buildHomeButton('${apiLojas[index].nome}',
                            '${apiLojas[index].logo}', () {
                          produtoID = apiLojas[index].id;
                          nomeLoja = apiLojas[index].nome;
                          descLoja = apiLojas[index].desc;
                          apiLogo = apiLojas[index].logo;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Produtoss()));
                        });
                      })),
              Divider(),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: double.infinity,
                child: Text("ÚLTIMAS NOTÍCIAS",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Colors.grey),
                    textAlign: TextAlign.start),
              ),
              buildNewsHome(),
              buildLogo(),
            ],
          ),
        ));
  }
}
