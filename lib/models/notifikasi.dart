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

class ProdukRequest {
  ProdukRequest({
    required this.productId,
    required this.namaProduk,
    required this.sisaStok,
  });

  String productId;
  String namaProduk;
  String sisaStok;

  factory ProdukRequest.fromJson(Map<String, dynamic> json) => Produk(
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
