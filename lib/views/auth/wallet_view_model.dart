import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xpay/base_vm.dart';
import 'package:xpay/data/request_money_model.dart';
import 'package:xpay/data/transaction_model.dart';
import 'package:xpay/data/user_model.dart';

class WalletViewModel extends BaseViewModel {
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  List<RequestMoneyModel> _requests = [];

  List<RequestMoneyModel> get requests => _requests;

  @override
  Future init() async {
    dataLoadingState = DataLoadingState.DataLoadComplete;
    notifyListeners();
  }

  Future<void> addMoney(double amount, String currency) async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) return;

      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid);
      DocumentSnapshot userSnapshot = await userRef.get();

      if (userSnapshot.exists) {
        UserModel user =
            UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
        user.walletBalances[currency] =
            (user.walletBalances[currency] ?? 0) + amount;

        await userRef.update({'wallet_balances': user.walletBalances});

        TransactionModel transaction = TransactionModel(
          transactionId:
              FirebaseFirestore.instance.collection('transactions').doc().id,
          userId: user.userId,
          amount: amount,
          timestamp: DateTime.now(),
          type: 'add',
          currency: currency,
        );

        await FirebaseFirestore.instance
            .collection('transactions')
            .doc(transaction.transactionId)
            .set(transaction.toMap());
      }
    } catch (e) {
      print('Error adding money: $e');
    }
  }

  Future<void> withdrawMoney(double amount, String currency) async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) return;

      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid);
      DocumentSnapshot userSnapshot = await userRef.get();

      if (userSnapshot.exists) {
        UserModel user =
            UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
        double currentBalance = user.walletBalances[currency] ?? 0;

        if (currentBalance >= amount) {
          user.walletBalances[currency] = currentBalance - amount;

          await userRef.update({'wallet_balances': user.walletBalances});

          TransactionModel transaction = TransactionModel(
            transactionId:
                FirebaseFirestore.instance.collection('transactions').doc().id,
            userId: user.userId,
            amount: amount,
            timestamp: DateTime.now(),
            type: 'withdraw',
            currency: currency,
          );

          await FirebaseFirestore.instance
              .collection('transactions')
              .doc(transaction.transactionId)
              .set(transaction.toMap());
        } else {
          print('Insufficient balance');
        }
      }
    } catch (e) {
      print('Error withdrawing money: $e');
    }
  }

  Future<double> getCurrentWalletBalance(String currency) async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) return 0.0;

      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get();

      if (userSnapshot.exists) {
        UserModel user =
            UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
        return user.walletBalances[currency] ?? 0.0;
      }
    } catch (e) {
      print('Error fetching wallet balance: $e');
    }
    return 0.0;
  }

  Future<void> sendMoneyToUser(
      String recipientEmail, double amount, String currency) async {
    print('recipientEmail: $recipientEmail');
    try {
      User? senderUser = FirebaseAuth.instance.currentUser;
      if (senderUser == null) return;

      // Fetch sender's details
      DocumentSnapshot senderSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(senderUser.uid)
          .get();
      if (!senderSnapshot.exists) return;

      UserModel sender =
          UserModel.fromMap(senderSnapshot.data() as Map<String, dynamic>);

      // Fetch recipient's details by email
      QuerySnapshot recipientQuery = await FirebaseFirestore.instance
          .collection('users')
          .where('email_address', isEqualTo: recipientEmail)
          .get();
      if (recipientQuery.docs.isEmpty) {
        throw 'Recipient with email $recipientEmail not found';
      }

      UserModel recipient = UserModel.fromMap(
          recipientQuery.docs.first.data() as Map<String, dynamic>);

      // Check if sender has enough balance
      double senderBalance = sender.walletBalances[currency] ?? 0;
      if (senderBalance < amount) {
        throw 'Insufficient balance to send money';
      }

      // Update sender's balance
      sender.walletBalances[currency] = senderBalance - amount;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(sender.userId)
          .update({'wallet_balances': sender.walletBalances});

      // Update recipient's balance
      recipient.walletBalances[currency] =
          (recipient.walletBalances[currency] ?? 0) + amount;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(recipient.userId)
          .update({'wallet_balances': recipient.walletBalances});

      // Record transaction for sender
      TransactionModel senderTransaction = TransactionModel(
        transactionId:
            FirebaseFirestore.instance.collection('transactions').doc().id,
        userId: sender.userId,
        amount: amount,
        timestamp: DateTime.now(),
        type: 'send',
        currency: currency,
      );
      await FirebaseFirestore.instance
          .collection('transactions')
          .doc(senderTransaction.transactionId)
          .set(senderTransaction.toMap());

      // Record transaction for recipient
      TransactionModel recipientTransaction = TransactionModel(
        transactionId:
            FirebaseFirestore.instance.collection('transactions').doc().id,
        userId: recipient.userId,
        amount: amount,
        timestamp: DateTime.now(),
        type: 'receive',
        currency: currency,
      );
      await FirebaseFirestore.instance
          .collection('transactions')
          .doc(recipientTransaction.transactionId)
          .set(recipientTransaction.toMap());

      // Notify listeners or update UI as needed
      notifyListeners();
    } catch (e) {
      print('Error sending money: $e');
      throw e; // Rethrow the error to handle it in the calling function
    }
  }

  Future<void> fetchTransactionHistory() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) return;

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('transactions')
          .where('userId', isEqualTo: firebaseUser.uid)
          .orderBy('timestamp', descending: true)
          .get();

      _transactions = querySnapshot.docs
          .map((doc) =>
              TransactionModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      notifyListeners();
    } catch (e) {
      print('Error fetching transaction history: $e');
    }
  }

  Future<void> requestMoney(String recipientEmail, double amount,
      String currency, String notes) async {
    try {
      // Validate amount
      if (amount <= 0) {
        throw 'Amount should be greater than zero';
      }
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Fetch recipient's details by email
      QuerySnapshot recipientQuery = await firestore
          .collection('users')
          .where('email_address', isEqualTo: recipientEmail)
          .get();
      if (recipientQuery.docs.isEmpty) {
        throw 'Recipient with email $recipientEmail not found';
      }

      // Create a new RequestMoneyModel for the request
      RequestMoneyModel requestMoney = RequestMoneyModel(
          requestId: firestore.collection('requests').doc().id,
          senderEmail: FirebaseAuth.instance.currentUser?.email,
          receiverEmail: recipientEmail,
          amount: amount,
          currency: currency,
          status: 'pending',
          requestedAt: DateTime.now(),
          notes: notes);

      // Store the request in Firestore under a 'requests' collection
      await firestore
          .collection('requests')
          .doc(requestMoney.requestId)
          .set(requestMoney.toMap());

      // Notify listeners or update UI as needed
      print('Money request sent successfully');
    } catch (e) {
      print('Error requesting money: $e');
      throw e; // Rethrow the error to handle it in the calling function
    }
  }

  Future<void> fetchRequests() async {
    try {
      String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;

      if (currentUserEmail == null) {
        throw 'User not logged in';
      }

      // Fetch requests where the current user is the sender
      QuerySnapshot senderRequestsSnapshot = await FirebaseFirestore.instance
          .collection('requests')
          .where('senderEmail', isEqualTo: currentUserEmail)
          .get();

      // Fetch requests where the current user is the receiver
      QuerySnapshot receiverRequestsSnapshot = await FirebaseFirestore.instance
          .collection('requests')
          .where('receiverEmail', isEqualTo: currentUserEmail)
          .get();

      // Combine the two lists of requests
      List<RequestMoneyModel> senderRequests = senderRequestsSnapshot.docs
          .map((doc) =>
              RequestMoneyModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      List<RequestMoneyModel> receiverRequests = receiverRequestsSnapshot.docs
          .map((doc) =>
              RequestMoneyModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      // Merge the lists
      _requests = [...senderRequests, ...receiverRequests];

      notifyListeners();
    } catch (e) {
      print('Error fetching requests: $e');
    }
  }

  Future<void> acceptRequest(RequestMoneyModel request) async {
    request.status = 'accepted';
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(request.requestId)
        .update(request.toMap());
    fetchRequests();
  }

  Future<void> declineRequest(RequestMoneyModel request) async {
    request.status = 'rejected';
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(request.requestId)
        .update(request.toMap());
    fetchRequests();
  }

  Future<void> cancelRequest(RequestMoneyModel request) async {
    request.status = 'canceled';
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(request.requestId)
        .update(request.toMap());
    fetchRequests();
  }
}
