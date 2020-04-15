import 'package:flutter/material.dart';
import 'package:flutterstate/sayac.dart';
import 'package:provider/provider.dart';

class ProviderPackageKullanimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mySayac = Provider.of<Sayac>(context); //bu bir kullanım mySayac2 de başka bir kullanım butonları bunla çalıştırdı yazdırmayı diğeriyle yaptı farkı yok
    return Consumer( // bu consumer widgetı ikinci yöntem birinciyi kullanacaksan bu widgetı kaldırman gerekir
      builder: (context,Sayac mySayac2, widget) => Scaffold(
        appBar: AppBar(
          title: Text("Provider Package Kullanımı"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${mySayac2.sayac}',
                style: Theme
                    .of(context)
                    .textTheme
                    .display1,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 1,
              onPressed: () {
                mySayac.artir();
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              heroTag: 2,
              onPressed: mySayac.azalt,
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
