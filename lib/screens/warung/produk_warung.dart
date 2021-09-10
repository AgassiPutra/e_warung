import 'package:flutter/material.dart';

class Warung extends StatefulWidget{
  const Warung({Key? key}) : super(key: key);

  @override
  _WarungState createState() => _WarungState();
}
class _WarungState extends State<Warung>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text("Produk Warung")
      ),
      body: Container(
        child:Column(
          children: [
            listViewProduct()
          ]
        )
      )
    );
  }
  Widget listViewProduct(){
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 100,
            child: Card(
              child: FlatButton(
                onPressed: () async {
                  print(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.production_quantity_limits),
                      title: Text('Produk ${entries[index]}'),
                      subtitle: Text('Harga '),
                    ),
                  ],
                ),
              ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}