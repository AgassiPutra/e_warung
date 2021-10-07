import 'package:flutter/material.dart';

class Produk {
  final int id;
  final String nama;
  final String harga_beli;
  final String harga_jual;
  final String stok;

  Produk(
      {required this.id,
      required this.nama,
      required this.harga_beli,
      required this.harga_jual,
      required this.stok});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      nama: json['nama'],
      harga_beli: json['harga_beli'],
      harga_jual: json['harga_jual'],
      stok: json['stok'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'harga_beli': harga_beli,
        'harga_jual': harga_jual,
        'stok': stok,
      };
}
