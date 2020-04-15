import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterstate/kullanici_ekrani.dart';
import 'package:flutterstate/login_page.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutterstate/user_repository.dart';

class ProviderwithFirebaseAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository userRepo, child){
        switch(userRepo.durum){
          case UserDurumu.Idle:
            return SplashEkran();
          case UserDurumu.OturumAciliyor:
          case UserDurumu.OturumAcilmamis:
            return LoginEkrani();
          case UserDurumu.OturumAcik:
            return KullaniciEkrani();
          default :
            return null;
        }
      }
    );
  }
}

class SplashEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash Ekran"),),
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
