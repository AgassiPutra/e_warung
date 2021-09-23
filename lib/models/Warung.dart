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
