class Kategori {
  final int id;
  final String kategori;

  Kategori({required this.id, required this.kategori});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: json['id'],
      kategori: json['kategori'],
    );
  }

  Map<String, dynamic> toJson() => {
        'kategori': kategori,
      };
}
