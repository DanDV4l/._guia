import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/loading.dart';
import 'package:ponto_guia/main.dart';

Widget buildHomeBar(f1, f2) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
    color: Colors.grey.shade300.withOpacity(0),
    width: double.infinity,
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildSmallBT(Icons.park_rounded, "PARQUE DAS ÁGUAS", f1),
        buildSmallBT(Icons.list, "TODAS AS LOJAS", f2)
      ],
    ),
  );
}

Widget buildSmallBT(icone, titulo, f) {
  return Container(
      child: GestureDetector(
    child: Row(
      children: [
        Icon(
          icone,
        ),
        //VerticalDivider(),
        Text(
          ' $titulo',
          textAlign: TextAlign.start,
        )
      ],
    ),
    onTap: f,
  ));
}

Widget buildSmallBT2(icone, titulo, f) {
  return Container(
      child: GestureDetector(
    child: Row(
      children: [
        Icon(
          icone,
          color: Colors.white,
        ),
        //VerticalDivider(),
        Text(' $titulo', style: TextStyle(color: Colors.white))
      ],
    ),
    onTap: f,
  ));
}

Widget buildHomeButton(titulo, logo, f) {
  return GestureDetector(
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        width: 150,
        height: 150,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    spreadRadius: 0.5,
                    blurRadius: 1,
                    offset: Offset(1, 1))
              ]),
          margin: EdgeInsets.all(3),
          child: ClipRRect(
            child: Image.network(
              logo,
              width: 150,
              height: 150,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      onTap: f);
}

Widget buildBody(content) {
  return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: content,
      ));
}

Widget buildBanner(imagens) {
  return Container(
    // padding: EdgeInsets.all(1),
    height: 320,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      /* boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 0))
        ]*/
    ),
    width: double.infinity,
    child: Carousel(
        autoplayDuration: Duration(seconds: 7),
        dotSize: 3,
        dotColor: Colors.green.shade300,
        dotBgColor: Colors.black.withOpacity(0),
        borderRadius: true,
        radius: Radius.circular(8),
        images: imagens),
  );
}

Widget buildLogo() {
  return Container(
    // height: 200,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(),
        Image.asset(
          'images/logo.png',
          //height: 150,
          width: 130,
        ),
        Text(
          '.GUIA',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 17, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Text(
          'v1.0.88A - 9621N',
          style: TextStyle(fontSize: 12, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Text(
          'VERSÃO DE DEMONSTRAÇÃO.',
          style: TextStyle(
              fontSize: 15, color: Colors.red, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        Divider()
      ],
    ),
  );
}

Widget buildBar2(titulo) {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 40,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withOpacity(0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        /* boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(1, 1))
          ]*/
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon(Icons.menu, color: Colors.white.withOpacity(0)),
          Text(titulo,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Image.asset('images/logo.png')
        ],
      ));
}

Widget buildProductBar(titulo) {
  return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 40,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withOpacity(0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        /* boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(1, 1))
          ]*/
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildSmallBT(Icons.arrow_back_ios, 'VOLTAR', () {
            Navigator.pop(contextvar);
          }),
          buildSmallBT(Icons.shopping_bag_outlined, 'MEUS PEDIDOS', () {
            showDialog<String>(
              context: contextvar,
              builder: (BuildContext context) => AlertDialog(
                title: Text('MEUS PEDIDOS',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                content: Text(
                  '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||',
                  textAlign: TextAlign.justify,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(
                      context,
                      'Cancelar',
                    ),
                    child: Text('Cancelar',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Confirmar',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ),
                ],
              ),
            );
          }),
        ],
      ));
}

Widget buildBar(titulo) {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 40,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withOpacity(0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        /* boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(1, 1))
          ]*/
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 2),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(contextvar);
              },
            ),
          ),
          Text(titulo,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Icon(
            Icons.menu,
            color: Colors.black.withOpacity(0),
          )
        ],
      ));
}

Widget buildSlideBT(icone, texto, f) {
  return GestureDetector(
    child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.black.withOpacity(0), width: 0),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 0.5,
                  blurRadius: 8,
                  offset: Offset(2, 2)),
            ]),
        width: double.infinity,
        height: 130,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    icone,
                    fit: BoxFit.cover,
                  )),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
            ),
            Text(
              texto,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )),
    onTap: f,
  );
}

double tamanho() {
  double _tamanho;
  if (swidth < 300) {
    _tamanho = 8.0;
  } else {
    _tamanho = 14.0;
  }
  print(swidth);
  return _tamanho;
}

Widget buildDescription(desc, logo) {
  return Container(
    height: sheight * 0.30,
    decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.all(Radius.circular(8))),
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]),
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                logo,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
            // height: 130,
            width: swidth * 0.6,
            child: Text(desc,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: tamanho(),
                )),
          )
        ]),
  );
}

Widget buildLiveBanner(apibanner) {
  return FutureBuilder(
      future: apibanner,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
                child: Center(
              child: Text('AGUARDE...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ));
          case ConnectionState.done:
            var _dados;
            _dados = snapshot.data;
            List<Object> objetosBanner = [];
            for (var objetos in _dados) {
              objetosBanner.add(NetworkImage(objetos.url));
            }
            return Container(
              height: sheight * 0.45,
              width: swidth,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                /* boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 0))
                  ]*/
              ),
              child: Carousel(
                  autoplayDuration: Duration(seconds: 4),
                  dotSize: 3,
                  dotColor: Colors.green.shade300,
                  dotBgColor: Colors.black.withOpacity(0),
                  borderRadius: true,
                  radius: Radius.circular(8),
                  images: objetosBanner),
            );
          case ConnectionState.active:
            return Container(
                child: Center(
              child: Text('AGUARDE...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ));
          case ConnectionState.none:
            return Container(
                child: Center(
              child: Text('AGUARDE...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ));
        }
      });
}

Widget buildLiveBanner2(apibanner) {
  return FutureBuilder(
      future: apibanner,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
                child: Center(
              child: Text('AGUARDE...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ));
          case ConnectionState.done:
            var _dados;
            _dados = snapshot.data;
            List<Object> objetosBanner = [];

            for (var objetos in _dados) {
              objetosBanner.add(NetworkImage(objetos.url));
            }
            return Container(
              margin: EdgeInsets.all(5),
              height: sheight * 0.30,
              width: swidth,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                /* boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 0))
                  ]*/
              ),
              child: Carousel(
                  autoplayDuration: Duration(seconds: 4),
                  dotSize: 3,
                  dotColor: Colors.green.shade300,
                  dotBgColor: Colors.black.withOpacity(0),
                  borderRadius: true,
                  radius: Radius.circular(8),
                  images: objetosBanner),
            );
          case ConnectionState.active:
            return Container(
                child: Center(
              child: Text('AGUARDE...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ));
          case ConnectionState.none:
            return Container(
                child: Center(
              child: Text('AGUARDE...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ));
        }
      });
}

Widget buildLabelButton(icone, titulo, desc) {
  return Container(
    color: Colors.green,
    height: 200,
    width: double.infinity,
    child: Row(
      children: [
        ClipRRect(
          child: Image.network(
            icone,
          ),
        ),
        VerticalDivider(),
        Column(
          children: [Text(titulo), Text(desc)],
        )
      ],
    ),
  );
}

Widget buildNewsHome() {
  return FutureBuilder(
    future: noticiaHomeAPI(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Container(
              child: Center(
            child: Text('AGUARDE...',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ));
        case ConnectionState.done:
          var _dados;
          _dados = snapshot.data;
          return Container(
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Text("${_dados[0].titulo}",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.black),
                    textAlign: TextAlign.center),
                Text("(${_dados[0].data})\n",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: Colors.black),
                    textAlign: TextAlign.start),
                Text("${_dados[0].conteudo}",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    textAlign: TextAlign.justify),
              ],
            ),
          );
        case ConnectionState.active:
          return Container(
              child: Center(
            child: Text('AGUARDE...',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ));
        case ConnectionState.none:
          return Container(
              child: Center(
            child: Text('AGUARDE...',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ));
      }
    },
  );
}
