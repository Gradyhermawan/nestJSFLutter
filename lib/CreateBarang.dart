import 'dart:convert';

import 'package:coba/Model/barang.dart';
import 'package:coba/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class createBarangPage extends StatelessWidget {
  const createBarangPage({super.key});
  static String route = '/Createbarang';


  @override
  Widget build(BuildContext context) {
    final TextEditingController nama = TextEditingController();
    final TextEditingController jumlah = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Barang"),
      ),
      body: Column(
        children: [
          Text("Nama"),
          TextFormField(
            controller: nama,
          ),
          Text("Jumlah"),
          TextFormField(
            controller: jumlah,
          ),
          TextButton(onPressed: () async {
            String payload= jsonEncode({
              'nama':nama.text,
              'jumlah':jumlah.text
            });
            try{
              Response res=await API.fetch("barangs", "post",payload);
              const snackBar = SnackBar(
                content: Text('Berhasil Menginputkan barang'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }catch(e){

            }

            // List<BarangModel> b=BarangModel.parseJson(res.body);
          }, child: Text("Create"))
        ],
      ),
    );
  }
}
