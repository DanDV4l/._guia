import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:ponto_guia/main.dart';

class Fontes {
  int _id;
  String _nome;
  String _url;
  String _desc;
  String _propriedades;
  String _icon;

  Fontes(this._id, this._nome, this._url, this._desc, this._propriedades,
      this._icon);

  get id => _id;
  get nome => _nome;
  get url => _url;
  get desc => _desc;
  get propriedades => _propriedades;
  get icon => _icon;

  set id(var value) {
    _id = value;
  }

  set nome(var value) {
    _nome = value;
  }

  set url(var value) {
    _url = value;
  }

  set desc(var value) {
    _desc = value;
  }

  set propriedades(var value) {
    _propriedades = value;
  }

  set icon(var value) {
    _icon = value;
  }
}

class Lojas {
  String _id;
  String _nome;
  String _desc;
  String _logo;
  String _categoria;
  String _tipo;

  Lojas(this._id, this._nome, this._desc, this._logo, this._categoria,
      this._tipo);

  get id => _id;
  get nome => _nome;
  get desc => _desc;
  get logo => _logo;
  get categoria => _categoria;
  get tipo => _tipo;

  set id(var value) {
    _id = value;
  }

  set nome(var value) {
    _nome = value;
  }

  set desc(var value) {
    _desc = value;
  }

  set logo(var value) {
    _logo = value;
  }

  set categoria(var value) {
    _categoria = value;
  }

  set tipo(var value) {
    _tipo = value;
  }
}

class Banners {
  String _url;
  Banners(this._url);
  get url => _url;
  set url(var value) {
    _url = value;
  }
}

class Noticia {
  String _titulo;
  String _data;
  String _conteudo;

  Noticia(this._titulo, this._data, this._conteudo);

  get titulo => _titulo;
  get data => _data;
  get conteudo => _conteudo;

  set titulo(var value) {
    _titulo = value;
  }

  set data(var value) {
    _data = value;
  }

  set conteudo(var value) {
    _conteudo = value;
  }
}

class Produtos {
  String _id;
  String _nome;
  String _desc;
  String _img;
  double _valor;

  Produtos(this._id, this._nome, this._desc, this._img, this._valor);

  get id => _id;
  get nome => _nome;
  get desc => _desc;
  get img => _img;
  get valor => _valor;

  set id(var value) {
    _id = value;
  }

  set nome(var value) {
    _nome = value;
  }

  set desc(var value) {
    _desc = value;
  }

  set img(var value) {
    _img = value;
  }

  set valor(var value) {
    _valor = value;
  }
}

Future<List<Lojas>> dadosLojas() async {
  List<Lojas> lLojas = [];
  http.Response response;
  var _url = Uri.parse(
      'https://raw.githubusercontent.com/DanDV4l/apis/main/jsons/lojas.json');
  response = await http.get(_url);

  var _dadosLojas = convert.jsonDecode(response.body);
  for (var lojas in _dadosLojas) {
    Lojas lojasData = Lojas(lojas['id'], lojas['nome'], lojas['desc'],
        lojas['logo'], lojas['categoria'], lojas['tipo']);
    lLojas.add(lojasData);
  }

  return lLojas;
}

Future<List<Fontes>> dadosParque() async {
  List<Fontes> dParque = [];
  var _api = Uri.parse(
      'https://raw.githubusercontent.com/DanDV4l/apis/main/jsons/fontes.json');

  http.Response response;
  response = await http.get(_api);
  var dados = convert.jsonDecode(response.body);

  for (var parqueDados in dados) {
    Fontes pdados = Fontes(
        parqueDados['id'],
        parqueDados['nome'],
        parqueDados['url'],
        parqueDados['desc'],
        parqueDados['propriedades'],
        parqueDados['icon']);
    dParque.add(pdados);
  }
  return dParque;
}

Future<List<Banners>> bannerHomeAPI() async {
  List<Banners> banner = [];
  http.Response response;
  var api = Uri.parse(
      "https://raw.githubusercontent.com/DanDV4l/apis/main/jsons/homebanner.json");
  response = await http.get(api);
  var ban = convert.jsonDecode(response.body);
  for (var bnn in ban) {
    Banners inBanner = Banners(bnn['url']);
    banner.add(inBanner);
  }

  return banner;
}

Future<List<Banners>> bannerLojasAPI() async {
  List<Banners> banner = [];
  http.Response response;

  var api = Uri.parse(
      'https://raw.githubusercontent.com/DanDV4l/apis/main/jsons/bannerListaLojas.json');
  response = await http.get(api);
  var ban = convert.jsonDecode(response.body);
  for (var bnn in ban) {
    Banners inBanner = Banners(bnn['url']);
    banner.add(inBanner);
  }
  return banner;
}

Future<List<Noticia>> noticiaHomeAPI() async {
  List<Noticia> lNoticia = [];
  http.Response response;
  var api = Uri.parse(
      "https://raw.githubusercontent.com/DanDV4l/apis/main/jsons/noticias.json");
  response = await http.get(api);
  var noticia = convert.jsonDecode(response.body);
  for (var dado in noticia) {
    Noticia homeNoticia =
        Noticia(dado['titulo'], dado['data'], dado['conteudo']);
    lNoticia.add(homeNoticia);
  }

  return lNoticia;
}

Future<List<Produtos>> produtosAPI(local) async {
  List<Produtos> lProdutos = [];
  http.Response response;
  var api = Uri.parse(
      "https://raw.githubusercontent.com/DanDV4l/apis/main/jsons/anunciantes/$local/produtos.json");
  response = await http.get(api);
  var produto = convert.jsonDecode(response.body);
  for (var product in produto) {
    Produtos produtos = Produtos(product['id'], product['nome'],
        product['desc'], product['img'], product['valor']);
    lProdutos.add(produtos);
  }
  //print(api.toString());
  return lProdutos;
}

Future<List<Banners>> produtoBannerAPI() async {
  List<Banners> lBanner = [];
  http.Response response;
  var api = Uri.parse(
      'https://raw.githubusercontent.com/DanDV4l/apis/main/jsons/anunciantes/$produtoID/banner.json');
  response = await http.get(api);
  var data = convert.jsonDecode(response.body);
  for (var banner in data) {
    Banners bnn = Banners(banner['url']);
    lBanner.add(bnn);
  }
  return lBanner;
}
