class Expirydate {
  int availble_days;
  int availble_files;

  Expirydate({
    required this.availble_days,
    required this.availble_files,
  });

  factory Expirydate.fromJson(Map<String, dynamic> json) =>
      Expirydate(
        availble_days: json["availble_days"],
        availble_files: json["availble_files"],
      );

  Map<String, dynamic> toJson() => {
        "availble_days": availble_days,
        "availble_files": availble_files,
      };
}