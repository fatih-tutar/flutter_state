import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum UserDurumu {Idle, OturumAcilmamis, OturumAciliyor, OturumAcik}

class UserRepository with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  UserDurumu _durum = UserDurumu.Idle;
  GoogleSignIn _googleSignIn;

  UserRepository(){
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
    _auth.onAuthStateChanged.listen(_onAuthStateChange);
  }

  FirebaseUser get user => _user;

  set user(FirebaseUser value) {
    _user = value;
  }

  UserDurumu get durum => _durum;

  set durum(UserDurumu value) {
    _durum = value;
  }

  Future<bool> signIn(String email, String sifre)async{
    try{
      _durum = UserDurumu.OturumAciliyor;
      notifyListeners();
      _auth.signInWithEmailAndPassword(email: email, password: sifre);
      return true;
    }catch(e){
      _durum = UserDurumu.OturumAcilmamis;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async{
    _auth.signOut();
    _googleSignIn.signOut();
    _durum = UserDurumu.OturumAcilmamis;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signWithGoogle()async{
    try{
      _durum = UserDurumu.OturumAciliyor;
      notifyListeners();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      await _auth.signInWithCredential(credential);
      return true;
    }catch(e){
      debugPrint(e);
      _durum = UserDurumu.OturumAcilmamis;
      return false;
    }
  }

  Future<void> _onAuthStateChange(FirebaseUser user) async{
    if(user == null){
      _durum = UserDurumu.OturumAcilmamis;
    }else{
      _user = user;
      _durum = UserDurumu.OturumAcik;
    }
    notifyListeners();
  }
}