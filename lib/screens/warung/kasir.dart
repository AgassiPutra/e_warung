import "package:flutter/material.dart";
import "package:sliding_up_panel/sliding_up_panel.dart"
import 'package:shared_preferences/shared_preferences.dart';

class Kasir extends StatefulWidget{
  const Kasir({Key? key}) : super(key: key);

  @override
  _KasirState createState() => _KasirState();
}
class _KasirState extends State<Kasir>{
  String dropdownValue = 'Semua';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(
          title: Container(
            padding:const EdgeInsets.all(10),
            height:65,
            child:Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled:true,
                      hintText: "Cari Produk",
                      suffixIcon: Icon(Icons.search),
                      isDense: true,
                      contentPadding: EdgeInsets.all(15)
                    )
                  ),
                ),
              ],
          ),
          ),
          
        ),
        body: SlidingUpPanel(
          panel: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children:[
                Text("0 Barang"),
                ListView.separated(
                  itemBuilder: itemBuilder, 
                  separatorBuilder: separatorBuilder, 
                  itemCount: itemCount
                )
              ]
            )
          ),
          body: Container(
          padding: const EdgeInsets.all(10),
          child:Column(
            children: [
              DropdownButtonFormField<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 20,
                elevation: 16,
                isExpanded: true,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                ),
                items: <String>['Semua', 'Daging', 'Sayur', 'Buah'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Expanded(child:listViewProduct())
          ],
        )
        )
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