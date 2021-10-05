class StokWarungModels{
  final int id;
  final String namaWarung;
  final int idProduk;
  final String namaProduk;
  final String stok;

  StokWarungModels({required this.id, required this.namaWarung, required this.idProduk, required this.namaProduk, required this.stok});

  factory StokWarungModels.fromJson(Map<String, dynamic> json) {
    return StokWarungModels(
      id: json['id'],
      namaWarung: json['nama_warung'],
      idProduk: json['produk']['product_id'],
      namaProduk: json['produk']['nama_produk'],
      stok: json['produk']['sisa_stok'],
    );
  }

  Map<String, dynamic> toJson() => {
        'namaWarung': namaWarung,
        'idProduk': idProduk,
        'namaProduk': namaProduk,
        'stok': stok,
      };
}