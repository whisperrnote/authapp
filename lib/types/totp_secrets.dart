class TotpSecrets {
  String userId;
  String issuer;
  String accountName;
  String secretKey;
  String? folderId;
  String? createdAt;
  String? updatedAt;
  String? algorithm;
  int? digits;
  int? period;

  TotpSecrets({
    required this.userId,
    required this.issuer,
    required this.accountName,
    required this.secretKey,
    this.folderId,
    this.createdAt,
    this.updatedAt,
    this.algorithm,
    this.digits,
    this.period,
  });

  factory TotpSecrets.fromMap(Map<String, dynamic> map) {
    return TotpSecrets(
      userId: map['userId'].toString(),
      issuer: map['issuer'].toString(),
      accountName: map['accountName'].toString(),
      secretKey: map['secretKey'].toString(),
      folderId: map['folderId']?.toString(),
      createdAt: map['createdAt']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
      algorithm: map['algorithm']?.toString(),
      digits: map['digits'],
      period: map['period'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "issuer": issuer,
      "accountName": accountName,
      "secretKey": secretKey,
      "folderId": folderId,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "algorithm": algorithm,
      "digits": digits,
      "period": period,
    };
  }
}
