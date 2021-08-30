import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Text(
                  'BERANDA',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        )),
        body: Container(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/tunas.png',
              ),
              Text(
                'Berita & Pengumuman',
                style: TextStyle(
                  fontSize: 22,
                  height: 2.0,
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: SizedBox(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 130.0,
                        child: Center(
                          child: Image.network(
                              'https://perumdatunas.com/storage/GambarBerita/jLUZmC9enzNqlowLEPHWK8BlGRTlSBSg7VbMqDbg.jpg'),
                        ),
                      ),
                      Container(
                        width: 130.0,
                        child: Center(
                          child: Image.network(
                              'https://perumdatunas.com/storage/GambarBerita/OIY0g7IpwgkSVCXUXp5PEONPly8qQdSKpVcmiKha.jpg'),
                        ),
                      ),
                      Container(
                        width: 130.0,
                        child: Center(
                          child: Image.network(
                              'https://perumdatunas.com/storage/GambarBerita/yp1bz3qzGFjzsisFzDayqWtMG2tksYpOD845Qc42.jpg'),
                        ),
                      ),
                      Container(
                        width: 130.0,
                        child: Center(
                          child: Image.network(
                              'https://perumdatunas.com/storage/GambarBerita/6p50howvS3cGUsLHoYwjDaijj7fsKuNH390PyPO9.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
