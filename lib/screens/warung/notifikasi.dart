import 'dart:convert';
import 'package:e_warung/models/warung/notifikasi.dart';
import 'package:e_warung/screens/warung/detail_notifikasi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_warung/env.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  late Future<List<NotifikasiModels>> notif;
  @override
  void initState() {
    super.initState();
    notif = getNotifikasiList();
    refresh();
  }

  refresh() {
    setState(() {});
  }

  Future<List<NotifikasiModels>> getNotifikasiList() async {
    final response =
        await http.get(Uri.parse("${Env.URL_PREFIX}/notifikasi?w=1"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<NotifikasiModels> notif = items.map<NotifikasiModels>((json) {
      return NotifikasiModels.fromJson(json);
    }).toList();

    return notif;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              title: Container(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notifikasi"),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text("Hapus Semua?"),
                            content: Text(
                                "Anda yakin ingin menghapus semua notifikasi?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Batal")),
                              TextButton(
                                  onPressed: () {},
                                  child: Text("Hapus",
                                      style: TextStyle(color: Colors.red)))
                            ]);
                      });
                },
              )
            ],
          ))),
          body: listNotifikasi(),
        ));
  }

  Widget listNotifikasi() {
    return FutureBuilder<List<NotifikasiModels>>(
        future: notif,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data[index];
              return Container(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailNotifikasi(notif: data)));
                    },
                    leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle_notifications,
                              color: Colors.red, size: 28)
                        ]),
                    title: (() {
                      if (data.isStocked == '0') {
                        return Text("Permintaan Tambah Produk",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold));
                      } else {
                        return Text("Permintaan Tambah Stok",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold));
                      }
                    }()),
                    subtitle: Container(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data.isAccepted == '0')
                                Text("Permintaan sedang diproses oleh Admin",
                                    style: TextStyle(color: Colors.black))
                              else
                                Text("${data.isAccepted} dari ${data.request} produk telah diproses",
                                    style: TextStyle(color: Colors.black)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${data.tanggal}")
                            ])),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ));
            },
          );
        });
  }
}
