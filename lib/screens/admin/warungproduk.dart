import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_warung/env.dart';
import 'package:e_warung/models/warung.dart';

class WarungProduk extends StatefulWidget {
  final Warung warung;
  WarungProduk({required this.warung});
  @override
  _WarungProduk createState() => _WarungProduk();
}

class _WarungProduk extends State<WarungProduk> {
  late Future<List<ProdukWarung>> produk;
  final produkListKey = GlobalKey<_WarungProduk>();
  @override
  void initState() {
    super.initState();
    produk = getProdukList();
  }

  Future<List<ProdukWarung>> getProdukList() async {
    final response = await http
        .get(Uri.parse("${Env.URL_PREFIX}/getstok.php?id=${widget.warung.id}"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ProdukWarung> produk = items.map<ProdukWarung>((json) {
      return ProdukWarung.fromJson(json);
    }).toList();

    return produk;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(' LIST PRODUK',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.store,
                      size: 50,
                    ),
                    title: Center(
                        child: Text(
                      '${widget.warung.nama_warung}',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 40),
                    )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: buildListViewbyIndex(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListViewbyIndex() {
    return FutureBuilder<List<ProdukWarung>>(
      future: produk,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // By default, show a loading spinner.
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        // Render student lists
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            var data = snapshot.data[index];
            return Container(
              height: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Container(
                            height: double.infinity, child: Icon(Icons.store)),
                        title: Text(data.nama_produk,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
