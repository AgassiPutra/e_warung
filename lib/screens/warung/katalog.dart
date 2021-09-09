import 'package:e_warung/screens/warung/detail_produk.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Katalog extends StatefulWidget{
  const Katalog({Key? key}) : super(key: key);

  @override
  _KatalogState createState() => _KatalogState();
}
class _KatalogState extends State<Katalog>{
  String dropdownValue = 'Semua';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(
          title: Container(
            padding:const EdgeInsets.all(10),
            height:60,
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex:8,
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
                Flexible(
                  flex:2,
                  child: GestureDetector(
                    onTap:(){},
                    child: Column(
                      children:[
                        Icon(Icons.store),
                        Text("Warung",softWrap:true,style:TextStyle(fontSize: 10))
                      ]
                    )
                  )
                )
              ],
          ),
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
              Expanded(child:gridViewKatalog())
          ],
        )
        )
      )
    );
    
  }
  Widget gridViewKatalog(){
    final List<Map> myKatalogs =
      List.generate(1000, (index) => {"id": index, "name": "Katalog $index"})
          .toList();

    return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: myKatalogs.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const DetailProduk())
                  );
                },
                child: Card(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child:Container(width:200,child:Icon(Icons.production_quantity_limits),decoration: BoxDecoration(color:Colors.pink),)),
                      Container(
                        padding:EdgeInsets.all(10),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(myKatalogs[index]["name"],style:TextStyle(fontSize:15)),
                                Text("Rp.3000",style:TextStyle(fontSize:13,color: Colors.grey))
                              ],
                            ),
                            // Icon(Icons.add)
                          ],
                        )
                      )
                    ],
                  )
              ));
            });
  }
}