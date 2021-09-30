import 'package:ponto_guia/main.dart';
import 'package:flutter/material.dart';
import 'package:ponto_guia/obj.dart';

var fonte_dados;

class Fontes extends StatefulWidget {
  @override
  _FontesState createState() => _FontesState();
}

class _FontesState extends State<Fontes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: buildBody([
            buildBanner([NetworkImage('${fonte_dados.url}')]),
            buildBar('${fonte_dados.nome}'),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                'SOBRE A FONTE',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
              width: double.infinity,
              child: Text(
                '${fonte_dados.desc}',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                'PROPRIEDADES E EFEITOS',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
              width: double.infinity,
              child: Text(
                '${fonte_dados.propriedades}',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.justify,
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              height: 300,
              width: swidth * 0.95,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: GridView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                scrollDirection: Axis.horizontal,
                itemCount: apiParque.length,
                itemBuilder: (context, index) {
                  return buildSlideBT(
                      '${apiParque[index].icon}', '${apiParque[index].nome}',
                      () {
                    fonte_dados = apiParque[index];
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Fontes(),
                      ),
                    );
                  });
                },
              ),
            ),
            Divider(),
            Text('Fonte de informações e pesquisas: CODEMG\n\n\n')
          ]),
        ),
      ),
    );
  }
}
