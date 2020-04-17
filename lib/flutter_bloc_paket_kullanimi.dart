import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterstate/bloc/sayac_bloc.dart';
import 'package:flutterstate/bloc/sayac_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstate/bloc_paket/sayi_bloc.dart';
import 'package:flutterstate/bloc_paket/sayi_event.dart';
import 'package:flutterstate/bloc_paket/sayi_state.dart';

class FlutterBlockPaketKullanimi extends StatefulWidget {
  @override
  _FlutterBlockPaketKullanimiState createState() => _FlutterBlockPaketKullanimiState();
}

class _FlutterBlockPaketKullanimiState extends State<FlutterBlockPaketKullanimi> {

  final _mySayiBloc = SayiBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SayiBloc>(
      create: (BuildContext context) => _mySayiBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Block Paket Kullanımı"),
        ),
        body: MyCenterWidget(),
        floatingActionButton: MyFloatingActionButtons(),
      ),
    );
  }
}

class MyFloatingActionButtons extends StatelessWidget {
  const MyFloatingActionButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: 1,
          onPressed: () {
            BlocProvider.of<SayiBloc>(context).add(SayiArttirEvent()); // iki farklı kullanımı gösterdin
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          heroTag: 2,
          onPressed: (){
            BlocProvider.of<SayiBloc>(context).onAzalt(); // iki farklı kullanımı gösterdin
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MySayiWidget(),
    );
  }
}

class MySayiWidget extends StatelessWidget {
  const MySayiWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _bloc = BlocProvider.of<SayiBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        BlocBuilder(
          bloc: _bloc,
          builder: (context, SayiState sayiState){
            return Text(
              '${sayiState.sayi.toString()}',
              style: TextStyle(fontSize: 48),
            );
          },
        )
      ],
    );
  }
}
