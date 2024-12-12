class TransactionModel {
  String transactionId;
  String userId;
  double amount;
  DateTime timestamp;
  String type; // 'add' or 'withdraw'
  String currency; // Currency code, e.g., 'USD', 'INR'

  TransactionModel({
    required this.transactionId,
    required this.userId,
    required this.amount,
    required this.timestamp,
    required this.type,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'transaction_id': transactionId,
      'userId': userId,
      'amount': amount,
      'timestamp': timestamp.toIso8601String(),
      'type': type,
      'currency': currency,
    };
  }

  static TransactionModel fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      transactionId: map['transaction_id'],
      userId: map['userId'],
      amount: map['amount'],
      timestamp: DateTime.parse(map['timestamp']),
      type: map['type'],
      currency: map['currency'],
    );
  }
}
