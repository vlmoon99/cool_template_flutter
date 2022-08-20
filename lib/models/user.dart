class JhipsterAuthorizedUser {
  JhipsterAuthorizedUser({
    this.email,
    this.firstName,
    this.langKey,
    this.lastName,
    this.login,
    this.password,
  });

  String? email;
  String? firstName;
  String? langKey;
  String? lastName;
  String? login;
  String? password;

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstName": firstName,
    "langKey": langKey,
    "lastName": lastName,
    "login": login,
    "password": password,
  };
}

class JhipsterLoginUser {
  String userLogin;
  String password;

  JhipsterLoginUser({required this.userLogin, required this.password});
  Map<String, dynamic> toJson() => {
    "username": userLogin,
    "password": password,
  };
}

class JhipsterRegisterUser{
  String login;
  String email;
  String password;
  JhipsterRegisterUser({required this.login, required this.email, required this.password});

  Map<String, dynamic> toJson() => {'login':login,'password':password,'email':email};
}

class JhipsterResetCode{
  String code;
  String password;

  JhipsterResetCode({required this.code, required this.password});
  Map<String, dynamic> toJson() => {"key":code,"newPassword":password,};
}

class JhipsterAccountInfo {
  int? id;
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  bool? activated;
  String? langKey;
  String? createdBy;
  String? createdDate;
  String? lastModifiedBy;
  String? lastModifiedDate;
  List<String>? authorities;
  bool isEmpty;

  JhipsterAccountInfo({
    this.id,
    this.login,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.activated,
    this.langKey,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.authorities,
    this.isEmpty = false,
  });

  factory JhipsterAccountInfo.fromJson(Map<String, dynamic> json) =>
      JhipsterAccountInfo(
        id: json["id"],
        login: json["login"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        activated: json["activated"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedDate: json["lastModifiedDate"],
        authorities: (json["authorities"] as List<dynamic>).map((e) =>
            e.toString()).toList(),
      );

  factory JhipsterAccountInfo.empty() =>
      JhipsterAccountInfo(
        id: -1,
        login: 'empty',
        firstName: 'empty',
        lastName: 'empty',
        email: 'empty',
        imageUrl: 'empty',
        activated: false,
        createdBy: 'empty',
        createdDate: 'empty',
        lastModifiedBy: 'empty',
        lastModifiedDate: 'empty',
        authorities: ["None"],
        isEmpty: true
      );



  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "login": login,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "imageUrl": imageUrl,
        "activated": activated,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedDate": lastModifiedDate,
        "authorities": authorities,
      };


  @override
  String toString() {
    return 'JhipsterAccountInfo{id: $id, login: $login, firstName: $firstName, lastName: $lastName, email: $email, imageUrl: $imageUrl, activated: $activated, langKey: $langKey, createdBy: $createdBy, createdDate: $createdDate, lastModifiedBy: $lastModifiedBy, lastModifiedDate: $lastModifiedDate, authorities: $authorities}';
  }

  JhipsterAccountInfo copyWith({
    int? id,
    String? login,
    String? firstName,
    String? lastName,
    String? email,
    String? imageUrl,
    bool? activated,
    String? langKey,
    String? createdBy,
    String? createdDate,
    String? lastModifiedBy,
    String? lastModifiedDate,
    List<String>? authorities,
  }) {
    return JhipsterAccountInfo(
      id: id ?? this.id,
      login: login ?? this.login,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      activated: activated ?? this.activated,
      langKey: langKey ?? this.langKey,
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
      lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
      authorities: authorities ?? this.authorities,
    );
  }
}

class JhipsterChangePasswordModel {
  String currentPassword;
  String newPassword;
  JhipsterChangePasswordModel({required this.currentPassword,required this.newPassword});
  Map<String, dynamic> toJson() => {"currentPassword":currentPassword,"newPassword":newPassword};
}