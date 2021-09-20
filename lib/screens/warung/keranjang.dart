import 'package:flutter/material.dart';
import 'dart:math';
class Keranjang extends StatefulWidget{
  
  @override
  _KeranjangState createState() => _KeranjangState();
}
class _KeranjangState extends State<Keranjang>{
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child:Column(
          children: [
            Expanded(child: listKeranjang()),
            Row(
              children:[
                Expanded(
                  child:ElevatedButton(
                    onPressed: (){}, 
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                    child: Text("Pesan Sekarang")
                  )
                )
              ]
            )
          ],
        )
      ),
    );
  }
  Widget listKeranjang(){
    Random rand = new Random();
    
    List<Map> keranjangku = List.generate(4, (index) => {
      "id": index,
      "product_name": "Product $index",
      "harga": "${index+1}.000",
      "stok": 8
    }); 

    return ListView.separated(
      itemCount: keranjangku.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: ListTile(
            leading: Container(
              height:150,
              decoration: BoxDecoration(color:Colors.yellow.shade400),
              child: Icon(Icons.check_box_outline_blank_rounded)
            ),
            title: Text(keranjangku[index]['product_name']),
            subtitle:Row(
              children:[
                Text(keranjangku[index]['harga']),
                IconButton(onPressed: (){},icon: Icon(Icons.delete)),
                buttonAddMinus(counter: keranjangku[index]['stok'],max:10)
              ]
            )
          )
        );
      }, 
      separatorBuilder: (BuildContext context, int index) => Divider(), 
    );
  }
  Widget buttonAddMinus({required int counter,int? max}){
    int _counter = counter;
    return Container(
      width: 130,
      height: 60,
      child: Row(
        children:[
          IconButton(
            onPressed: (){
              setState(() {
                if(_counter !=0){
                  _counter--;
                }
              });
            },
            icon: Icon(Icons.remove,color: ((){if(counter == 0){return Colors.grey;}else{return Colors.blue;}}()))
          ),
          Expanded(
            child:TextField(
              // expands:true,
              textAlign:TextAlign.center,
              controller: TextEditingController()..text = '$_counter',
              onChanged: (text){
                counter = int.parse(text);
                text = "$_counter";
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none
              ),      
              keyboardType: TextInputType.number,
            )
          ),
          IconButton(
            onPressed: (){
              setState(() {
                if(_counter != max){
                  _counter++;
                }
              });
            },
            icon: Icon(Icons.add,color: ((){if(_counter == max){return Colors.grey;}else{return Colors.blue;}}()))
          ),
        ]
      )
    );
  }
}