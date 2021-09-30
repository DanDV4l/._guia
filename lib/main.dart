// @dart=2.9

import 'package:flutter/material.dart';
import 'package:ponto_guia/home.dart';

var apiLojas;
var apiParque;
var apiProdutos;
var apiLogo;
var produtoID = "";
var nomeLoja;
var descLoja;
var swidth;
var sheight;
var contextvar;

List bannerApi = [];

void main() {
  runApp(MaterialApp(title: '.Guia', home: Home()));
}
