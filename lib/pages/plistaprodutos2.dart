import 'package:flutter/material.dart';
import 'package:ponto_guia/obj.dart';
import 'package:ponto_guia/classes.dart';
import 'package:ponto_guia/main.dart';

void descricao() {}

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({Key? key}) : super(key: key);

  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  var teste = produtoID;
  double txtsize = descLoja.length <= 100 ? 17 : 15;

  @override
  Widget build(BuildContext context) {
    //  novaLista();
    return SafeArea(
      child: Scaffold(

          //bottomNavigationBar: buildBar2(),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: buildBody([
              buildBar2('$nomeLoja'),
              buildLiveBanner2(produtoBannerAPI()),
              buildProductBar(''),

              Divider(),
              Text('Toque no produto para ver mais detalhes.'),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 14),
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  width: swidth,
                  height: sheight * 0.46,
                  //descLoja.length > 150 ? sheight * 0.49 : sheight * 0.48,
                  //  height: sheight * 0.59,
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
                      })),
              //Divider(),
            ]),
          )),
    );
  }
}
