class KatalogModels {
  final int id;
  final String nama;
  final String kategori;
  final String hargaBeli;
  final String hargaJual;
  final int stok;
  final String satuan;
  final bool isReady;

  KatalogModels({required this.id, required this.nama, required this.kategori,required this.hargaBeli,required this.hargaJual,required this.stok,required this.satuan,required this.isReady});

  factory KatalogModels.fromJson(Map<String, dynamic> json) {
    return KatalogModels(
      id: json['id'],
      nama: json['nama_produk'],
      kategori: json['kategori'],
      hargaBeli: json['harga_beli'],
      hargaJual: json['harga_jual'],
      stok: json['stok'],
      satuan: json['satuan'],
      isReady: json['is_ready']
    );
  }

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'kategori': kategori,
        'hargaBeli': hargaBeli,
        'hargaJual': hargaJual,
        'stok': stok,
        'satuan': satuan,
        'isReady': isReady
      };
}