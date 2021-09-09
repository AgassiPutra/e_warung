import 'package:e_warung/screens/admin/responnotif.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Notifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('NOTIFIKASI'),
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
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
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
                      MaterialPageRoute(builder: (context) => Respon()),
                    );
                  },
                  child: ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: Icon(Icons.message),
                      title: Text(
                          'Warung ${entries[index]} ingin menambah stok produk'),
                      subtitle: const Text('2020-01-12')),
                )));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 10,
      ),
    );
  }
}
