import 'package:coba/CreateBarang.dart';
import 'package:coba/HalamanBarang.dart';
import 'package:flutter/material.dart';


var routes = <String, WidgetBuilder>{
  Barang.route: (context) => const Barang(),
  createBarangPage.route: (context) => const createBarangPage(),
};
