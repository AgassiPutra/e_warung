import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class WarungProduk extends StatelessWidget {
  final myProducts = List<String>.generate(20, (i) => 'Product $i');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(' List Produk'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.store, size: 50),
                      title: Text(
                        'Nama Warung',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      subtitle: Text(
                        'Nama Pemilik',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: myProducts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      key: UniqueKey(),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(myProducts[index])),
                    );
                  }),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  // Widget buildListViewbyIndex() {
  //   final List<String> entries = <String>['A', 'B', 'C'];
  //   final List<int> colorCodes = <int>[600, 500, 100];

  //   return ListView.separated(
  //     padding: const EdgeInsets.all(8),
  //     itemCount: entries.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Container(
  //         height: 50,
  //         color: Colors.amber[colorCodes[index]],
  //         child: Center(
  //             child: Text(
  //                 'Warung meminta tambahan stok pada makanan ${entries[index]}')),
  //       );
  //     },
  //     separatorBuilder: (BuildContext context, int index) => const Divider(),
  //   );
  // }
}
