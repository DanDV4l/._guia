import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ponto_guia/obj.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/main.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({Key? key}) : super(key: key);

  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(apiLogo), fit: BoxFit.fitWidth)),
            height: 250,
            width: swidth,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 50,
              ),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    //color: Colors.black.withOpacity(0.5),
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  nomeLoja,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 0, 0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: Offset(3, 3))
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      apiLogo,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  width: swidth * 0.45,
                  child: Text(descLoja),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 300),
              child: Container(
                  height: sheight * 0.50,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: apiProdutos.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.fromLTRB(5, 3, 5, 3),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  trailing: IconButton(
                                    icon: Icon(Icons.add, color: Colors.black),
                                    onPressed: () {},
                                  ),
                                  leading: ClipRRect(
                                    child: Image.network(
                                      '${apiProdutos[index].img}',
                                      fit: BoxFit.cover,
                                      width: 70,
                                      height: 75,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  title: Text('${apiProdutos[index].nome}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                  subtitle: Text(
                                    'R\$${apiProdutos[index].valor.toStringAsFixed(2)}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  onTap: () {
                                    showDialog<String>(
                                      barrierColor:
                                          Colors.black.withOpacity(0.6),
                                      context: contextvar,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        backgroundColor: Colors.black,
                                        title: Text(
                                          '${apiProdutos[index].nome}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Container(
                                          child: Text(
                                            '${apiProdutos[index].desc}',
                                            style: TextStyle(
                                                color: Colors.grey.shade500),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        actions: [
                                          IconButton(
                                              icon: Icon(
                                                  Icons.image_search_rounded,
                                                  color: Colors.green,
                                                  size: 37),
                                              onPressed: () {}),
                                          IconButton(
                                              icon: Icon(Icons.close,
                                                  color: Colors.red, size: 43),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Divider(
                                  color: Colors.grey.shade700,
                                )
                              ],
                            ));
                      })))
        ],
      ))),
    );
  }
}
