import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

// class Kasir extends StatelessWidget{
//   const Kasir({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:Scaffold(
//         appBar: AppBar(
//           title: Text('Transaksi'),
//           body
//         ),

//       )
//     );
//   }
// }

class Product extends StatefulWidget{
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}
class _ProductState extends State<Product>{
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
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10)
              child:DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 14,
                elevation: 16,
                isExpanded: true,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Semua', 'Daging', 'Sayur', 'Buah']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Text(dropdownValue),
          ],
        )
      )
    );
    
  }
}