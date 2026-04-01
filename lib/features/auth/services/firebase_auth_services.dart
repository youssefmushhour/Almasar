import 'package:el_masar/features/auth/data/models/user_data_class.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential?> register(UserDataClass userData) async {
    try {
      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: userData.email,
            password: userData.password,
          );
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  static Future<UserCredential?> login(UserDataClass userData) async {
    try {
      UserCredential? userCredential = await _auth
          .signInWithEmailAndPassword(
            email: userData.email,
            password: userData.password,
          );
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  static Future<void> logout() async {
    
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

}
