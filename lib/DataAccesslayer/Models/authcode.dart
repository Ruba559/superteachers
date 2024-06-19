class AuthCode {
  String otp;
  String message;

  AuthCode({
    required this.otp,
    required this.message,
  });

  factory AuthCode.fromJson(Map<String, dynamic> json) =>
      AuthCode(
        otp: json["otp"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "message": message,
      };
}