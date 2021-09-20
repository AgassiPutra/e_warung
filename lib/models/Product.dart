class Produk {
  final int id;
  final String nama;
  final String harga;

  Produk({required this.id, required this.nama, required this.harga});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'harga': harga,
      };
}
