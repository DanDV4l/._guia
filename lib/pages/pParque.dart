import 'package:flutter/material.dart';
import 'package:ponto_guia/main.dart';
import 'package:ponto_guia/obj.dart';
import 'package:ponto_guia/pages/pfontes.dart';

String descricao_parque =
    'O Parque das Águas Dr. Lisandro Carneiro Guimarães é conhecido por suas águas minerais terapêuticas e conta com área de 210 mil metros quadrados, contendo um gêiser, um coreto, esculturas e diversos outros elementos paisagísticos e mobiliários, além de 10 fontanários de águas minerais, cada uma delas com propriedades diferentes. O empreendimento oferece atrações para todos os gostos e idades, com  quadras de tênis de saibro, quadras de vôlei tradicional e de areia,  pista de cooper, área de piquenique, piscinas de água mineral (adulto e infantil), vestiários, ringue de patinação, playground e teleférico, por exemplo.  Devido à pandemia, alguns serviços poderão sofrer restrições. Telefone para informações: (35) 3341-1370.';

class PParque extends StatefulWidget {
  @override
  _PParqueState createState() => _PParqueState();
}

class _PParqueState extends State<PParque> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Container(
                margin: EdgeInsets.fromLTRB(5, 15, 5, 0),
                child: Column(
                  children: [
                    buildBanner(
                        [NetworkImage('https://i.imgur.com/BeKjsmy.jpg?1')]),
                    buildBar('PARQUE DAS ÁGUAS'),
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        width: double.infinity,
                        child: Text(
                          descricao_parque,
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        )),
                    Divider(),
                    Text(' FONTES \n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      height: 400,
                      width: swidth * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        scrollDirection: Axis.horizontal,
                        itemCount: apiParque.length,
                        itemBuilder: (context, index) {
                          return buildSlideBT('${apiParque[index].icon}',
                              '${apiParque[index].nome}', () {
                            fonte_dados = apiParque[index];
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => Fontes(),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                    buildLogo(),
                  ],
                ))),
      ),
    );
  }
}
