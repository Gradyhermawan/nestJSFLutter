import 'dart:convert';

class BarangModel{
  final int? id;
  final String nama;
  final String jumlah;

  BarangModel({
    this.id,
    required this.nama,
    required this.jumlah,
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) => BarangModel(
    id: json['id'],
    nama: json['nama'],
    jumlah: json['jumlah'],
  );


  static List<BarangModel> parseJson(String json) {
    var parsed = jsonDecode(json);
    return parsed.map<BarangModel>((json) => BarangModel.fromJson(json)).toList();
  }
}