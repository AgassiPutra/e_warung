import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:sliding_up_panel/sliding_up_panel.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Kasir extends StatefulWidget{
  const Kasir({Key? key}) : super(key: key);

  @override
  _KasirState createState() => _KasirState();
}
class _KasirState extends State<Kasir>{
  String dropdownValue = 'Semua';
  double stateTotal = 0.0;
  
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(
          title: Container(
            padding:const EdgeInsets.all(10),
            height:60,
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
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder()
                    )
                  ),
                ),
              ],
          ),
          ),
        ),
        body: Stack(
          children: [
            SlidingUpPanel(
              maxHeight: screenSize.height-120,
              minHeight: 120,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              panel: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children:[
                    Icon(Icons.drag_handle,size: 24,color: Colors.grey,),
                    Row(mainAxisAlignment:MainAxisAlignment.start,children:[Text("3 Barang",style:TextStyle(fontSize: 18))]),
                    SizedBox(height:20),
                    Flexible(child:listRequestProduct()),
                    Container(padding:EdgeInsets.fromLTRB(8, 0, 8, 0),child: Divider(height: 10,thickness: 1)),
                    SizedBox(height:10),
                    Container(padding:EdgeInsets.fromLTRB(8,0,8,0),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Total"), Text("Rp.200000")]))
                  ]
                ),
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
                      isDense:true,
                      contentPadding: EdgeInsets.fromLTRB(8, 12, 12, 8),
                      border:OutlineInputBorder(),
                    ),
                    items: <String>['Semua', 'Daging', 'Sayur', 'Buah'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Flexible(child:listViewProduct())
                ],
              )
              ),
            ),
            Positioned(
              bottom:0,
              child:Container(
                decoration: BoxDecoration(color: Colors.white),
                padding:const EdgeInsets.all(10),
                width:screenSize.width,
                height:60,
                child:ElevatedButton(
                  onPressed: (){},
                  child: Text("Transaksi")
                )
              )
            )
          ],
        )
        )
      );
    
  }
  Widget listRequestProduct(){
    final List<Map> myProducts =
      List.generate(3, (index) => {"id": index, "name": "Product $index","harga": 3000,"jumlah":index+1})
          .toList();
    
    return ListView.separated(
      shrinkWrap:true,
      padding: const EdgeInsets.all(8),
      itemCount: myProducts.length,
      itemBuilder: (BuildContext context, int index) {
        int subtotal = myProducts[index]['harga'] * myProducts[index]['jumlah'];
        // double total = 0;
        // total = total + subtotal;
        // setState((){
        //   stateTotal = total;
        //   }
        // );
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              Text(myProducts[index]["name"],style:TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height:10),
              Text("Rp.${myProducts[index]['harga']} x ${myProducts[index]['jumlah']}")
            ]),
            Column(
              children:[
              Icon(Icons.edit,size: 18),
              SizedBox(height:10),
              Text("Rp.$subtotal")
            ]),
          ]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
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