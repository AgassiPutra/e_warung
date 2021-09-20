import 'package:e_warung/screens/warung/detail_produk_warung.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListWarungProduk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('BARANG',
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

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 100,
            child: Card(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Container(
                          height: double.infinity, child: Icon(Icons.store)),
                      title: Text('Warung ${entries[index]}',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400)),
                      subtitle: Text(
                        'Stok : x',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProduk()),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          iconSize: 30,
                          color: Colors.grey,
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 10,
      ),
    );
  }
}
