import 'dart:convert';

import 'package:e_warung/screens/admin/warungproduk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'package:e_warung/env.dart';
import 'package:e_warung/models/warung.dart';

class ListWarung extends StatefulWidget {
  @override
  _WarungState createState() => _WarungState();
}

class _WarungState extends State<ListWarung> {
  late Future<List<Warung>> warung;
  final produkListKey = GlobalKey<_WarungState>();
  @override
  void initState() {
    super.initState();
    warung = getWarungList();
  }

  Future<List<Warung>> getWarungList() async {
    final response =
        await http.get(Uri.parse("${Env.URL_PREFIX}/list_warung.php"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Warung> produk = items.map<Warung>((json) {
      return Warung.fromJson(json);
    }).toList();

    return produk;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('WARUNG',
              style: TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            buildListViewbyIndex(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildListViewbyIndex() {
    final List<String> entries = <String>['A', 'B', 'C'];

    return FutureBuilder<List<Warung>>(
      future: warung,
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
                  child: FlatButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WarungProduk(warung: data)),
                      );
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: Container(
                                height: double.infinity,
                                child: Icon(Icons.store)),
                            title: Text(data.nama_warung,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400)),
                            subtitle: Text(
                              'Jumlah Produk : ' +
                                  data.jumlah_produk.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        );
      },
    );
  }

  // Widget buildListViewbyIndex() {
  //   final List<String> entries = <String>['A', 'B', 'C'];

  //   return ListView.separated(
  //     physics: NeverScrollableScrollPhysics(),
  //     padding: const EdgeInsets.all(8),
  //     itemCount: entries.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Container(
  //           height: 100,
  //           child: Card(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10.0),
  //             ),
  //             child: FlatButton(
  //               onPressed: () async {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => WarungProduk()),
  //                 );
  //               },
  //               child: Container(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     ListTile(
  //                       leading: Container(
  //                           height: double.infinity, child: Icon(Icons.store)),
  //                       title: Text('Warung ${entries[index]}',
  //                           style: TextStyle(
  //                               fontFamily: 'Poppins',
  //                               fontWeight: FontWeight.w400)),
  //                       subtitle: Text(
  //                         'Stok : x',
  //                         style:
  //                             TextStyle(color: Colors.black.withOpacity(0.6)),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ));
  //     },
  //     separatorBuilder: (BuildContext context, int index) => const Divider(
  //       height: 10,
  //     ),
  //   );
  // }
}
