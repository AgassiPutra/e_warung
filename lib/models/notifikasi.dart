class Notifikasi {
  final int id;
  final String nama;
  final String pesan;

  Notifikasi({required this.id, required this.nama, required this.pesan});

  factory Notifikasi.fromJson(Map<String, dynamic> json) {
    return Notifikasi(
      id: json['id'],
      nama: json['nama'],
      pesan: json['pesan'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'pesan': pesan,
      };
}
