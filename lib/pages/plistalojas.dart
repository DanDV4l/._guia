import 'package:flutter/material.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/obj.dart';
import 'package:ponto_guia/produtos.dart';
import 'package:ponto_guia/main.dart';

//var produtoID = "";

class PListaLojas extends StatefulWidget {
  @override
  _PListaLojasState createState() => _PListaLojasState();
}

class _PListaLojasState extends State<PListaLojas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: buildBody([
              // buildLiveBanner(bannerLojasAPI()),
              buildBar("TODAS AS LOJAS"),
              Container(
                width: double.infinity,
                height: sheight * 0.83,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: apiLojas.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300.withOpacity(0),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          children: [
                            ListTile(
                                leading: ClipRRect(
                                  child:
                                      Image.network('${apiLojas[index].logo}'),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                title: Text(apiLojas[index].nome,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                subtitle: Text(
                                    "Categoria: ${apiLojas[index].categoria}\n${apiLojas[index].tipo}",
                                    style: TextStyle(fontSize: 15)),
                                trailing: IconButton(
                                  icon: Icon(Icons.person_pin_rounded,
                                      color: Colors.grey.shade600, size: 30),
                                  onPressed: () {
                                    showDialog<String>(
                                      context: contextvar,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        backgroundColor: Colors.black,
                                        title: Text('${apiLojas[index].nome}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 30)),
                                        content: Text(
                                          '${apiLojas[index].desc}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 18),
                                        ),
                                        actions: <Widget>[
                                          IconButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            icon: Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 37,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                onTap: () {
                                  produtoID = apiLojas[index].id;
                                  nomeLoja = apiLojas[index].nome;
                                  descLoja = apiLojas[index].desc;
                                  apiLogo = apiLojas[index].logo;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Produtoss()));
                                }),
                            Divider()
                          ],
                        ),
                      );
                    }),
              ),
              //buildLogo(),
              Text('\n\n')
            ]),
          )),
    );
  }
}
