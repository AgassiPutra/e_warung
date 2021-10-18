class DetailNotifikasiModels {
    DetailNotifikasiModels({
        required this.id,
        required this.namaProduk,
        required this.stok,
        required this.isAccepted,
        required this.alasan,
    });

    String id;
    String namaProduk;
    String stok;
    dynamic isAccepted;
    dynamic alasan;

    factory DetailNotifikasiModels.fromJson(Map<String, dynamic> json) => DetailNotifikasiModels(
        id: json["id"],
        namaProduk: json["nama_produk"],
        stok: json["stok"],
        isAccepted: json["is_accepted"],
        alasan: json["alasan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_produk": namaProduk,
        "stok": stok,
        "is_accepted": isAccepted,
        "alasan": alasan,
    };
}
