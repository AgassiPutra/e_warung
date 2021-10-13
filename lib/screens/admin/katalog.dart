import 'dart:convert';

import 'package:e_warung/models/kategori.dart';
import 'package:e_warung/screens/admin/tambahkategori.dart';
import 'package:e_warung/screens/admin/tambahproduk.dart';
import 'package:e_warung/screens/admin/updatekategori.dart';
import 'package:e_warung/screens/admin/updateproduk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

import 'package:e_warung/env.dart';
import 'package:e_warung/models/product.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Produk>> produk;
  late Future<List<Kategori>> kategori;
  final produkListKey = GlobalKey<_HomeState>();
  int indexTab = 0;
  @override
  void initState() {
    super.initState();
    produk = getProdukList();
    kategori = getKategoriList();
    refresh();
  }

  refresh() {
    setState(() {});
  }

  Future<List<Produk>> getProdukList() async {
    final response = await http.get(Uri.parse("${Env.URL_PREFIX}/list.php"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Produk> produk = items.map<Produk>((json) {
      return Produk.fromJson(json);
    }).toList();

    return produk;
  }

  Future<List<Kategori>> getKategoriList() async {
    final response =
        await http.get(Uri.parse("${Env.URL_PREFIX}/list_kategori.php"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Kategori> kategori = items.map<Kategori>((json) {
      return Kategori.fromJson(json);
    }).toList();

    return kategori;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: produkListKey,
          appBar: AppBar(
            leading: Icon(Icons.search),
            title: TextFormField(
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              decoration: const InputDecoration(
                hintText: 'Cari',
              ),
            ),
            bottom: TabBar(
                onTap: (index) {
                  setState(() {
                    indexTab = index;
                  });
                },
                tabs: [
                  Tab(text: 'PRODUK'),
                  // Tab(icon: Icon(Icons.production_quantity_limits)),
                  Tab(text: 'KATEGORI'),
                ]),
          ),
          body: TabBarView(
            children: [
              buildListViewbyIndex(),
              buildListViewbyIndexKategori(),
            ],
          ),
          floatingActionButton: indexTab == 0
              ? FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddProduct()),
                    );
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.blue,
                )
              : FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TambahKategori()),
                    );
                  },
                  child: Icon(CupertinoIcons.add),
                  backgroundColor: Colors.blue,
                ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildListViewbyIndex() {
    // final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
    final entries = List<String>.generate(1000, (i) => '$i');

    return FutureBuilder<List<Produk>>(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                            height: double.infinity,
                            child: const Icon(Icons.shop_2_rounded)),
                        title: Text(data.nama,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400)),
                        subtitle: Text('Rp ${data.harga_beli}',
                            style: const TextStyle(fontFamily: 'Poppins')),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateProduk(produk: data)),
                                ),
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 30,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }

  Widget buildListViewbyIndexKategori() {
    return FutureBuilder<List<Kategori>>(
      future: kategori,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                            height: double.infinity,
                            child: const Icon(Icons.shop_2_rounded)),
                        title: Text(data.nama,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateKategori(kategori: data)),
                                ),
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 30,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }

//dummy
//   Widget buildListViewbyIndexKategori() {
//     final List<String> entries = <String>['A', 'B', 'C'];

//     return ListView.separated(
//       padding: const EdgeInsets.all(8),
//       itemCount: entries.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           height: 100,
//           child: Card(
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ListTile(
//                     leading: const Icon(Icons.menu),
//                     title: Text('Kategori ${entries[index]}',
//                         style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500)),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: () => {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //       builder: (context) => const UpdateProduk()),
//                             // ),
//                           },
//                           icon: const Icon(Icons.delete),
//                           iconSize: 30,
//                           color: Colors.red,
//                         ),
//                         IconButton(
//                           onPressed: () => {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const UpdateKategori()),
//                             ),
//                           },
//                           icon: const Icon(Icons.edit),
//                           iconSize: 30,
//                           color: Colors.blue,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) => const Divider(),
//     );
//   }
//   // child: Text('Kategori ${entries[index]}'),
// }

//tampil data dummy
// Widget buildListViewbyIndex() {
//     // final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
//     final entries = List<String>.generate(1000, (i) => '$i');

//     return ListView.separated(
//       padding: const EdgeInsets.all(8),
//       itemCount: entries.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//             height: 100,
//             child: Card(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ListTile(
//                     leading: Container(
//                         height: double.infinity,
//                         child: Icon(Icons.production_quantity_limits)),
//                     title: Text('Produk ${entries[index]}',
//                         style: TextStyle(fontFamily: 'Poppins-Bold')),
//                     subtitle:
//                         Text('Harga ', style: TextStyle(fontFamily: 'Poppins')),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: () => {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //       builder: (context) => const UpdateProduk()),
//                             // ),
//                           },
//                           icon: const Icon(Icons.delete),
//                           iconSize: 30,
//                           color: Colors.red,
//                         ),
//                         IconButton(
//                           onPressed: () => {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const UpdateProduk()),
//                             ),
//                           },
//                           icon: const Icon(Icons.edit),
//                           iconSize: 30,
//                           color: Colors.blue,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ));
//       },
//       separatorBuilder: (BuildContext context, int index) => const Divider(),
//     );
//   }
}
