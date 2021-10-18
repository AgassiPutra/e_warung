class NotifikasiModels {
    NotifikasiModels({
        required this.id,
        required this.isStocked,
        required this.request,
        required this.isAccepted,
        required this.tanggal,
    });

    String id;
    String isStocked;
    String request;
    String isAccepted;
    String tanggal;

    factory NotifikasiModels.fromJson(Map<String, dynamic> json) => NotifikasiModels(
        id: json["id"],
        isStocked: json["is_stocked"],
        request: json["request"],
        isAccepted: json["is_accepted"],
        tanggal: json["tanggal"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_stocked": isStocked,
        "request": request,
        "is_accepted": isAccepted,
        "tanggal": tanggal,
    };
}
