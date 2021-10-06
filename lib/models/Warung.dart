class Warung {
  final int id;
  final String nama;
  final String stok;

  Warung({required this.id, required this.nama, required this.stok});

  factory Warung.fromJson(Map<String, dynamic> json) {
    return Warung(
      id: json['id'],
      nama: json['nama'],
      stok: json['stok'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'stok': stok,
      };
}

class Produk {
  Produk({
    required this.productId,
    required this.namaProduk,
    required this.sisaStok,
  });

  String productId;
  String namaProduk;
  String sisaStok;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        productId: json["product_id"],
        namaProduk: json["nama_produk"],
        sisaStok: json["sisa_stok"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "nama_produk": namaProduk,
        "sisa_stok": sisaStok,
      };
}
