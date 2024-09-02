import 'package:coba/CreateBarang.dart';
import 'package:coba/Model/barang.dart';
import 'package:coba/api.dart';
import 'package:flutter/material.dart';

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
                            
                          }, child: const Text("Edit"))),
                          DataCell(TextButton(onPressed: () {
                            
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
