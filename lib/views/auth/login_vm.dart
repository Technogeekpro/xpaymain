import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:xpay/data/user_model.dart';

import '../../base_vm.dart';

class LoginViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<String> signUp(UserModel user) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: user.emailAddress, password: user.password);
      _user = result.user;
      user.userId = _user!.uid;

      if (_user != null) {
        await saveUserDetails(user);
        return '';
      } else {
        debugPrint('User is null');
        return 'User is null';
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('signInError: $e');
      if (e.code == 'email-already-in-use') {
        return 'The email address is already in use.';
      } else if (e.code == 'user-disabled') {
        return 'The user account has been disabled.';
      } else if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        return 'The email address is not formatted correctly.';
      } else if (e.code == 'weak-password') {
        return 'The password provided is not strong enough.';
      } else if (e.code == 'operation-not-allowed') {
        return 'This sign-in method is not enabled.';
      } else if (e.code == 'too-many-requests') {
        return 'Too many requests. Please try again later.';
      } else {
        return 'Error signing in: ${e.message}';
      }
    } catch (e) {
      debugPrint('Error signing in: $e');
      return 'Error signing in: $e';
    } finally {
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();

      _user = null;
    } catch (error) {
      debugPrint('Sign out error: $error');
    } finally {
      notifyListeners();
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _user = result.user;

      if (_user != null) {
        return '';
      } else {
        debugPrint('User is null');
        return 'User is null';
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('signInError: $e');
      if (e.code == 'email-already-in-use') {
        return 'The email address is already in use.';
      } else if (e.code == 'user-disabled') {
        return 'The user account has been disabled.';
      } else if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        return 'The email address is not formatted correctly.';
      } else if (e.code == 'weak-password') {
        return 'The password provided is not strong enough.';
      } else if (e.code == 'operation-not-allowed') {
        return 'This sign-in method is not enabled.';
      } else if (e.code == 'too-many-requests') {
        return 'Too many requests. Please try again later.';
      } else {
        return 'Error signing in: ${e.message}';
      }
    } catch (e) {
      debugPrint('Error signing in: $e');
      return 'Error signing in: $e';
    } finally {
      notifyListeners();
    }
  }

  Future<String> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      debugPrint('signInError: $e');
      if (e.code == 'email-already-in-use') {
        return 'The email address is already in use.';
      } else if (e.code == 'user-disabled') {
        return 'The user account has been disabled.';
      } else if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        return 'The email address is not formatted correctly.';
      } else if (e.code == 'weak-password') {
        return 'The password provided is not strong enough.';
      } else if (e.code == 'operation-not-allowed') {
        return 'This sign-in method is not enabled.';
      } else if (e.code == 'too-many-requests') {
        return 'Too many requests. Please try again later.';
      } else {
        return 'Error signing in: ${e.message}';
      }
    } catch (e) {
      debugPrint('Error signing in: $e');
      return 'Error signing in: $e';
    } finally {
      notifyListeners();
    }
    return '';
  }

  // Future<void> getUserData() async {
  //   var firebaseUser = FirebaseAuth.instance.currentUser;
  //   await Prefs.uid.set(firebaseUser?.uid ?? "uniqueId");
  //   await _updateUserData(firebaseUser);
  // }
  //
  // Future<void> _updateUserData(User? user) async {
  //   final userService = UserService();
  //   UserModel? userModel;
  //   if (user != null) {
  //     if (await userService.exists(user.uid)) {
  //       userModel = await userService.readSingle(user.uid, forceFetch: true);
  //     } else {
  //       // creating a new user
  //       final userModal = UserModel(
  //         displayName: user.displayName ?? "displayName",
  //         firstName: "",
  //         lastName: "",
  //         username: "username",
  //         uid: user.uid,
  //         email: user.email ?? "email",
  //         isFTUComplete: false,
  //         dpUrl: "",
  //         gender: UserModel.genders[3],
  //         isBrand: false,
  //       );
  //
  //       userModel = await userService.createWithId(user.uid,
  //           userModal); // creating user object with default data here, which will be updated later
  //     }
  //     if (userModel != null) {
  //       await Prefs.isFTUComplete.set(userModel.isFTUComplete);
  //       await Prefs.isLoginUserIsBrand.set(userModel.isBrand);
  //       GlobalData().isLoginUserIsBrand = await Prefs.isLoginUserIsBrand.get();
  //     }
  //   } else {
  //     throw Exception("Firebase instance of the User is null");
  //   }
  // }

  @override
  Future init() async {
    dataLoadingState = DataLoadingState.DataLoadComplete;
    notifyListeners();
  }

  Future<void> saveUserDetails(UserModel user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(user.userId).set(user.toMap()).catchError((error) {
      debugPrint("Failed to add user: $error");
    });
  }
}
