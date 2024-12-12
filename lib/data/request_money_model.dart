class RequestMoneyModel {
  String? requestId;
  String? senderEmail;
  String? receiverEmail;
  double? amount;
  String? currency;
  String? status; // Pending, Accepted, Declined, Canceled by user
  DateTime? requestedAt;
  String? notes;

  RequestMoneyModel(
      {this.requestId,
      this.senderEmail,
      this.receiverEmail,
      this.amount,
      this.currency,
      this.status,
      this.requestedAt,
      this.notes});

  // Convert RequestMoneyModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'requestId': requestId,
      'senderEmail': senderEmail,
      'receiverEmail': receiverEmail,
      'amount': amount,
      'currency': currency,
      'status': status,
      'requestedAt': requestedAt?.toIso8601String(),
      'notes': notes
    };
  }

  // Create RequestMoneyModel from Firestore document snapshot
  factory RequestMoneyModel.fromMap(Map<String, dynamic> map) {
    return RequestMoneyModel(
        requestId: map['requestId'],
        senderEmail: map['senderEmail'],
        receiverEmail: map['receiverEmail'],
        amount: map['amount'],
        currency: map['currency'],
        status: map['status'],
        requestedAt: map['requestedAt'] != null
            ? DateTime.parse(map['requestedAt'])
            : null,
        notes: map['notes']);
  }
}
