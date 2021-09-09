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
            
          ]
        )
      )
    );
  }
}