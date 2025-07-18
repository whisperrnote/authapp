class Credentials {
  String userId;
  String name;
  String? url;
  String username;
  String? notes;
  String? folderId;
  List<String>? tags;
  String? customFields;
  String? faviconUrl;
  String? createdAt;
  String? updatedAt;
  String password;

  Credentials({
    required this.userId,
    required this.name,
    this.url,
    required this.username,
    this.notes,
    this.folderId,
    this.tags,
    this.customFields,
    this.faviconUrl,
    this.createdAt,
    this.updatedAt,
    required this.password,
  });

  factory Credentials.fromMap(Map<String, dynamic> map) {
    return Credentials(
      userId: map['userId'].toString(),
      name: map['name'].toString(),
      url: map['url']?.toString(),
      username: map['username'].toString(),
      notes: map['notes']?.toString(),
      folderId: map['folderId']?.toString(),
      tags: List<String>.from(map['tags'] ?? []) ?? [],
      customFields: map['customFields']?.toString(),
      faviconUrl: map['faviconUrl']?.toString(),
      createdAt: map['createdAt']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
      password: map['password'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "name": name,
      "url": url,
      "username": username,
      "notes": notes,
      "folderId": folderId,
      "tags": tags,
      "customFields": customFields,
      "faviconUrl": faviconUrl,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "password": password,
    };
  }
}
