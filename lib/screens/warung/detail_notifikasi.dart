import 'package:flutter/material.dart';
import 'package:e_warung/models/warung/notifikasi.dart';
import 'package:e_warung/models/warung/detail_notifikasi.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:e_warung/env.dart';
import 'dart:convert';

class DetailNotifikasi extends StatefulWidget {
  late final NotifikasiModels notif;
  DetailNotifikasi({required this.notif});

  @override
  _DetailNotifikasiState createState() => _DetailNotifikasiState();
}

class _DetailNotifikasiState extends State<DetailNotifikasi> {
  late Future<List<DetailNotifikasiModels>> req;
  @override
  void initState() {
    super.initState();
    req = getRequestList();
    refresh();
  }

  refresh() {
    setState(() {});
  }

  Future<List<DetailNotifikasiModels>> getRequestList() async {
    final response = await http.get(Uri.parse(
        "${Env.URL_PREFIX}/detail-notifikasi?req=${widget.notif.id}"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<DetailNotifikasiModels> req =
        items.map<DetailNotifikasiModels>((json) {
      return DetailNotifikasiModels.fromJson(json);
    }).toList();

    return req;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (() {
            if (widget.notif.isStocked == '0') {
              return Text("Permintaan Tambah Produk");
            } else {
              return Text("Permintaan Tambah Stok");
            }
          }()),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, size: 35),
                        SizedBox(height: 10),
                        Text("Pesan Masuk",
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        Text(widget.notif.tanggal,
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ])),
              Divider(thickness: 1, height: 2),
              // isi pesan
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.notif.isStocked == '0')
                        Text("Permintaan Tambah Produk",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      else
                        Text("Permintaan Tambah Stok",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      if (widget.notif.isAccepted == 0)
                        Text("Permintaan sedang diproses oleh Admin",
                            style: TextStyle(color: Colors.black))
                      else
                        Text(
                            "${widget.notif.isAccepted} dari ${widget.notif.request} produk telah diproses",
                            style: TextStyle(color: Colors.black)),
                    ],
                  )),
              Expanded(child: listProductConfirmed())
            ])));
  }

  Widget listProductConfirmed() {
    final List<Map> products = List.generate(
        10, //length
        (index) => {
              "id": index,
              "product_name": "Product $index",
              "stok": Random().nextInt(300),
              "is_confirmed": 0,
              "message": "Stok sedang kosong"
            });
    return FutureBuilder<List<DetailNotifikasiModels>>(
        future: req,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                    child: ListTile(
                  leading: Icon(Icons.message), // diganti dengan gambar produk
                  title: Text(data.namaProduk),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Stok ditambah: ${data.stok}"),
                        if (data.isAccepted == '0')
                          Text("Alasan: ${data.alasan}")
                      ]),
                  trailing: (() {
                    if (data.isAccepted == '1') {
                      return Text("Diterima",
                          style: TextStyle(color: Colors.green));
                    } else if (data.isAccepted == '0') {
                      return Text("Ditolak",
                          style: TextStyle(color: Colors.red));
                    } else {
                      return Text("Sedang Diproses",
                          style: TextStyle(color: Colors.blue));
                    }
                  }()),
                ));
              });
        });
  }
}
