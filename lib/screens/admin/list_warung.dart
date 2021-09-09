import 'package:e_warung/screens/admin/warungproduk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class ListWarung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('WARUNG'),
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
              child: FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WarungProduk()),
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Icon(Icons.store),
                        title: Text('Warung ${entries[index]}'),
                        subtitle: Text(
                          'Stok : x',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
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
