import 'dart:convert';

import 'package:coba/Model/barang.dart';
import 'package:coba/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
TextEditingController nama = TextEditingController();
TextEditingController jumlah = TextEditingController();
class updateBarangPage extends StatefulWidget {
  updateBarangPage({super.key,required this.barangModel});
  static String route = '/UpdateBarang';
  BarangModel barangModel;
  @override
  State<updateBarangPage> createState() => _updateBarangPageState();
}

class _updateBarangPageState extends State<updateBarangPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nama.text=widget.barangModel.nama;
    jumlah.text=widget.barangModel.jumlah;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Update Barang"),
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
              Response res=await API.fetch("barangs/${widget.barangModel.id}", "update",payload);
              const snackBar = SnackBar(
                content: Text('Berhasil Update barang'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }catch(e){

            }

            print(nama.text);
            // List<BarangModel> b=BarangModel.parseJson(res.body);
          }, child: Text("Update"))
        ],
      ),
    );
  }
}
