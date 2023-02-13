import 'package:firebase_auth/firebase_auth.dart';
import 'package:practicefirebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user obj based on FirebaseUser
  MyUser? _userFromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid,isEmailVerified: user.emailVerified) : null;
  }

  //auth change user stream
  Stream<MyUser> get user {
    
    return _auth
        .authStateChanges()
        .map((User? user) {
          if(user!.emailVerified){
            return  _userFromFirebaseUser(user)!;
          }
          else{
            user.sendEmailVerification();
            _auth.signOut;
            print("not verified;");
            return _userFromFirebaseUser(null!)!;
          }
       
        });
  }

  // sign in anonymous
  Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      // return user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // return user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
