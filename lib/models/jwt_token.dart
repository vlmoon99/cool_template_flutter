
class JwtToken {
  JwtToken({
    required this.idToken,
  });

  String idToken;

  factory JwtToken.fromJson(Map<String, dynamic> json) => JwtToken(
    idToken: json["id_token"],
  );

  Map<String, dynamic> toJson() => {
    "id_token": idToken,
  };

  @override
  String toString() {
    return 'JwtToken{idToken: $idToken}';
  }


  bool get isCorrect => idToken.isNotEmpty;
}
