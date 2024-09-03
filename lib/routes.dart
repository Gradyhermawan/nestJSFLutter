import 'package:coba/CreateBarang.dart';
import 'package:coba/HalamanBarang.dart';
import 'package:coba/Model/barang.dart';
import 'package:coba/UpdateBarang.dart';
import 'package:flutter/material.dart';

import 'Menu.dart';


var routes = <String, WidgetBuilder>{
  Barang.route: (context) => const Barang(),
  createBarangPage.route: (context) => const createBarangPage(),
  updateBarangPage.route: (context) => updateBarangPage(barangModel: ModalRoute.of(context)?.settings.arguments as BarangModel),
  ContohMenu.route: (context) => const ContohMenu(),
};
