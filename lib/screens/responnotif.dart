import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Respon extends StatelessWidget {
  final myProducts = List<String>.generate(20, (i) => 'Product $i');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(' RESPON NOTIFIKASI'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Nama Produk'),
              Text('Warung x meminta penambahan stok pada produk y'),
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
