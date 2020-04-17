import 'package:flutter/material.dart';
import 'package:flutterstate/block_kullanimi.dart';
import 'package:flutterstate/firebaseauth_provider.dart';
import 'package:flutterstate/flutter_bloc_paket_kullanimi.dart';
import 'package:flutterstate/provider_package_kullanimi.dart';
import 'package:flutterstate/sayac.dart';
import 'package:flutterstate/stream_kullanimi.dart';
import 'package:flutterstate/user_repository.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => new Sayac(0),),
        ChangeNotifierProvider(create: (context) => new UserRepository(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }

  // BİRİNCİ YÖNTEM BU BİRAZ UZAYABİLİR PROVIDER EKLENDİKÇE
  /*@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new Sayac(0),
      child: ChangeNotifierProvider(
        create: (context) => new UserRepository(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }*/
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            RaisedButton(
              color: Colors.yellow,
              child: Text("Provider Package Kullanımı"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ProviderPackageKullanimi()));
              },
            ),
            RaisedButton(
              color: Colors.pink,
              child: Text("Provider Firebase Auth"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ProviderwithFirebaseAuth()));
              },
            ),
            RaisedButton(
              color: Colors.purple,
              child: Text("Stream Kullanımı"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => StreamKullanimi()));
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("Block Kullanımı"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => BlockKullanimi()));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("Flutter Block Paket Kullanımı"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => FlutterBlockPaketKullanimi()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}