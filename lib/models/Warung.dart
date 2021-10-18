class Warung {
  final int id;
  final String nama_warung;
  final int jumlah_produk;

  Warung(
      {required this.id,
      required this.nama_warung,
      required this.jumlah_produk});

  factory Warung.fromJson(Map<String, dynamic> json) {
    return Warung(
      id: json['id'],
      nama_warung: json['nama_warung'],
      jumlah_produk: json['jumlah_produk'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nama_warung': nama_warung,
        'jumlah_produk': jumlah_produk,
      };
}

class ProdukWarung {
  final int id;
  final String nama_produk;

  ProdukWarung({required this.id, required this.nama_produk});

  factory ProdukWarung.fromJson(Map<String, dynamic> json) => ProdukWarung(
        id: json["id"],
        nama_produk: json["nama_produk"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_produk": nama_produk,
      };
}
