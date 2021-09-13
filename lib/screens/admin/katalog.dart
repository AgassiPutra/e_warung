import 'package:e_warung/screens/admin/list_warung.dart';
import 'package:e_warung/screens/admin/tambahkategori.dart';
import 'package:e_warung/screens/admin/tambahproduk.dart';
import 'package:e_warung/screens/admin/updatekategori.dart';
import 'package:e_warung/screens/admin/updateproduk.dart';
import 'package:e_warung/screens/admin/warungproduk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexTab = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.search),
            title: TextFormField(
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: TextStyle(
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

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 100,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: Container(
                        height: double.infinity,
                        child: Icon(Icons.production_quantity_limits)),
                    title: Text('Produk ${entries[index]}',
                        style: TextStyle(fontFamily: 'Poppins-Bold')),
                    subtitle:
                        Text('Harga ', style: TextStyle(fontFamily: 'Poppins')),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const UpdateProduk()),
                            // ),
                          },
                          icon: const Icon(Icons.delete),
                          iconSize: 30,
                          color: Colors.red,
                        ),
                        IconButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UpdateProduk()),
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
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget buildListViewbyIndexKategori() {
    final List<String> entries = <String>['A', 'B', 'C'];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          child: Card(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.menu),
                    title: Text('Kategori ${entries[index]}',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const UpdateProduk()),
                            // ),
                          },
                          icon: const Icon(Icons.delete),
                          iconSize: 30,
                          color: Colors.red,
                        ),
                        IconButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UpdateKategori()),
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
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
  // child: Text('Kategori ${entries[index]}'),
}
