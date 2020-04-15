import 'package:flutter/material.dart';
import 'package:flutterstate/user_repository.dart';
import 'package:provider/provider.dart';

class LoginEkrani extends StatefulWidget {
  @override
  _LoginEkraniState createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _email, _sifre;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController(text: "");
    _sifre = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final userRepo = Provider.of<UserRepository>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login Ekran"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true, //EKRANDA DİKEY OLARAK ORTALAMAYA YARIYOR
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _email,
                  validator: (deger) {
                    if (deger.length <= 0) {
                      return "Lütfen email alanını doldurun";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _sifre,
                  validator: (deger) {
                    if (deger.length <= 0) {
                      return "Lütfen şifre alanını doldurun";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Şifre",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              userRepo.durum == UserDurumu.OturumAciliyor
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (!await userRepo.signIn(
                                _email.text.trim(), _sifre.text.trim())) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("Email / Şifre Hatalı"),
                              ));
                            }
                          }
                        },
                        color: Colors.green,
                        child: Text("Giriş Yap"),
                      ),
                    ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () async {
                            userRepo.signWithGoogle();
                          },
                          color: Colors.red,
                          child: Text("Gmail ile Giriş Yap"),
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
