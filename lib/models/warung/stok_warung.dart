class StokWarungModels {
    StokWarungModels({
        required this.productId,
        required this.namaProduk,
        required this.sisaStok,
    });

    String productId;
    String namaProduk;
    String sisaStok;

    factory StokWarungModels.fromJson(Map<String, dynamic> json) => StokWarungModels(
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
