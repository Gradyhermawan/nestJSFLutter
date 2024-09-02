import 'package:coba/CreateBarang.dart';
import 'package:coba/Model/barang.dart';
import 'package:coba/UpdateBarang.dart';
import 'package:coba/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Barang extends StatelessWidget {
  const Barang({super.key});
  static String route = '/barang';

  @override
  Widget build(BuildContext context) {
    Future<String> _getDataFromAPI() async {
      final response = await API.fetch("barangs", "get");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load data from API');
      }
    }
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: () {
            Navigator.pushNamed(context, createBarangPage.route);
          }, child: const Text("Create")),
          const SizedBox(height: 24,),
          FutureBuilder(
            future: _getDataFromAPI(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<BarangModel> item=snapshot.data!=null?BarangModel.parseJson(snapshot.data):[];
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 0,
                  sortColumnIndex: 0,
                  showCheckboxColumn: false,
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Nama",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text(
                        "Jumlah",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text(
                        "Edit",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text(
                        "Delete",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                      numeric: false,
                    ),
                  ],
                  rows: item
                      .map(
                        (u) => DataRow(
                        cells: [
                          DataCell(Text(u.nama,style:const TextStyle(color: Colors.black87))),
                          DataCell(Text(u.jumlah,style:const TextStyle(color: Colors.black87))),
                          DataCell(TextButton(onPressed: () {
                            Navigator.pushNamed(context, updateBarangPage.route,arguments: BarangModel(id: u.id,nama: u.nama, jumlah: u.jumlah));
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => updateBarangPage(barangModel: BarangModel(id:,nama: u.nama, jumlah: jumlah.text) )));
                            // try{
                            //
                            //   API.fetch("barangs/${u.id}", "update");
                            //   const snackBar = SnackBar(
                            //     content: Text('Berhasil Update barang'),
                            //   );
                            //
                            //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            // }catch(e){
                            //   print(e.toString());
                            // }
                          }, child: const Text("Edit"))),
                          DataCell(TextButton(onPressed: () {
                            try{
                              API.fetch("barangs/${u.id}", "delete");
                              const snackBar = SnackBar(
                                content: Text('Berhasil Delete barang'),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }catch(e){
                              print(e.toString());
                            }

                          }, child: const Text("Delete")))
                        ]),
                  )
                      .toList(),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
