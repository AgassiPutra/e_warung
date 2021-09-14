import 'package:e_warung/screens/warung/detail_notifikasi.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget{
  const Notifikasi({Key? key}) : super(key: key);

  @override
  _NotifikasiState createState() => _NotifikasiState();
}
class _NotifikasiState extends State<Notifikasi>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title:Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifikasi"),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          title:Text("Hapus Semua?"),
                          content: Text("Anda yakin ingin menghapus semua notifikasi?"),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              }, 
                              child: Text("Batal")
                            ),
                            TextButton(
                              onPressed: (){}, 
                              child: Text("Hapus",style:TextStyle(color:Colors.red))
                            )
                          ]
                        );
                      });
                  }, 
                )
              ],
            )
          )
        ),
        body: listNotifikasi(),
      )
    );
  }
  Widget listNotifikasi(){
    final List<Map> notifs = 
      List.generate(10,(index) => {
        "id":index, 
        "header": "Permintaan Tambah Produk",
        "pesan":"8 dari 10 produk telah ditambahkan, Barang akan segera dikirim",
        "tanggal": "${index+1} Sept 2021"
        }
      ); 
    return ListView.separated(
      itemCount: notifs.length,
      itemBuilder: (BuildContext context, int index){
        return Container(
          padding: const EdgeInsets.all(10),
          child:ListTile(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> DetailNotifikasi())
              );
            },
            leading: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[Icon(
                Icons.circle_notifications,
                color:Colors.red,
                size:28
              )]
            ),
            title: Text("${notifs[index]['header']}",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
            subtitle: Container(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${notifs[index]['pesan']}",style:TextStyle(color:Colors.black)),
                SizedBox(height: 5,),
                Text("${notifs[index]['tanggal']}")
              ]
            )),
            trailing: Icon(Icons.arrow_forward_ios),
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}