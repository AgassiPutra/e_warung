import 'dart:convert';

StokWarungModels stokWarungModelsFromJson(String str) => StokWarungModels.fromJson(json.decode(str));

String StokWarungModelsToJson(StokWarungModels data) => json.encode(data.toJson());

class StokWarungModels {
    StokWarungModels({
        required this.id,
        required this.namaWarung,
        required this.produk,
    });

    String id;
    String namaWarung;
    List<Produk> produk;

    factory StokWarungModels.fromJson(Map<String, dynamic> json) => StokWarungModels(
        id: json["id"],
        namaWarung: json["nama_warung"],
        produk: List<Produk>.from(json["produk"].map((x) => Produk.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_warung": namaWarung,
        "produk": List<dynamic>.from(produk.map((x) => x.toJson())),
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
