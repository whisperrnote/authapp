class Folders {
  String userId;
  String name;
  String? parentFolderId;
  String? createdAt;
  String? updatedAt;

  Folders({
    required this.userId,
    required this.name,
    this.parentFolderId,
    this.createdAt,
    this.updatedAt,
  });

  factory Folders.fromMap(Map<String, dynamic> map) {
    return Folders(
      userId: map['userId'].toString(),
      name: map['name'].toString(),
      parentFolderId: map['parentFolderId']?.toString(),
      createdAt: map['createdAt']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "name": name,
      "parentFolderId": parentFolderId,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
