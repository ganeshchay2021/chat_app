import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_chat_app/data/services/database_method.dart';

import '../model/user_model.dart';
import '../services/base_repository.dart';

class AuthRepository extends BaseRepository {

    Stream<User?> get authStateChange => auth.authStateChanges();

  //create user of user signup
  Future<UserModel> signUp({
    required String fullName,
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final formatttedPhoneNumber =
          phoneNumber.replaceAll(RegExp(r'\s+'), "".trim());

      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user == null) {
        throw "Failed to create user";
      }

      //create a user model and save the user in firebase database
      final user = UserModel(
          uid: userCredential.user!.uid,
          fullName: fullName,
          userName: userName,
          email: email,
          phoneNumber: formatttedPhoneNumber);
      await DatabaseMethod().saveUserData(user);
      return user;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //user sign in
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user == null) {
        throw "Failed to login";
      }
      final userData =
          await DatabaseMethod().getUserData(userCredential.user!.uid);
      return userData;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //sign out
  Future<void> signOut()async{
    try{
      await auth.signOut();
    }catch(e){
      log(e.toString());
    }
  }
}
