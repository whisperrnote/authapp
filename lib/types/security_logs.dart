class SecurityLogs {
  String userId;
  String eventType;
  String? ipAddress;
  String? userAgent;
  String? details;
  String timestamp;

  SecurityLogs({
    required this.userId,
    required this.eventType,
    this.ipAddress,
    this.userAgent,
    this.details,
    required this.timestamp,
  });

  factory SecurityLogs.fromMap(Map<String, dynamic> map) {
    return SecurityLogs(
      userId: map['userId'].toString(),
      eventType: map['eventType'].toString(),
      ipAddress: map['ipAddress']?.toString() ?? null,
      userAgent: map['userAgent']?.toString() ?? null,
      details: map['details']?.toString() ?? null,
      timestamp: map['timestamp'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "eventType": eventType,
      "ipAddress": ipAddress,
      "userAgent": userAgent,
      "details": details,
      "timestamp": timestamp,
    };
  }
}
