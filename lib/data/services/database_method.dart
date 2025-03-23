import 'package:real_chat_app/data/services/base_repository.dart';

import '../model/user_model.dart';

class DatabaseMethod extends BaseRepository{
    //save user data to firebase database
  Future<void> saveUserData(UserModel user) async {
    try {
      firestore.collection("userData").doc(user.uid).set(user.toMap());
    } catch (e) {
      throw "Faield to save user data";
    }
  }

  
  //get user from firebase database
  Future<UserModel> getUserData(String uid) async {
    try{
      final doc= await firestore.collection("userData").doc(uid).get();
      if(!doc.exists){
        throw "User data not found";
      }else{
        return UserModel.fromFireStore(doc);
      }
    }catch(e){
      throw "Faild to get user's data";
    }
  }
}