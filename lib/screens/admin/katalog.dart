import 'package:e_warung/screens/admin/list_warung.dart';
import 'package:e_warung/screens/admin/tambahkategori.dart';
import 'package:e_warung/screens/admin/tambahproduk.dart';
import 'package:e_warung/screens/admin/updatekategori.dart';
import 'package:e_warung/screens/admin/updateproduk.dart';
import 'package:e_warung/screens/admin/warungproduk.dart';
import 'package:flutter/material.dart';
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
            centerTitle: true,
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
            title: const Text('KATALOG'),
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
                  child: Icon(Icons.add),
                ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildListViewbyIndex() {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 100,
            child: Card(
              color: Colors.amber[colorCodes[index]],
              child: FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateProduk()),
                  );
                },
                child: Text('Produk ${entries[index]}'),
              ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget buildListViewbyIndexKategori() {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 100,
            child: Card(
              color: Colors.amber[colorCodes[index]],
              child: FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateKategori()),
                  );
                },
                child: Text('Kategori ${entries[index]}'),
              ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
