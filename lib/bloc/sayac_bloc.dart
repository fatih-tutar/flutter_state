import 'dart:async';
import 'package:flutterstate/bloc/sayac_event.dart';

class SayacBloc{
  int _sayac = 0;
  //STATE İÇİN STREAM CONTROLLER
  final _sayacStateStreamController = StreamController<int>();
  Stream<int> get sayac => _sayacStateStreamController.stream;
  StreamSink<int> get _sayacStateSink => _sayacStateStreamController.sink;

  //EVENTLER İÇİN STREAM CONTROLLER
  final _sayacEventStreamController = StreamController<SayacEvent>();
  Stream<SayacEvent> get _sayacEventStream => _sayacEventStreamController.stream;
  StreamSink<SayacEvent> get sayacEventSink => _sayacEventStreamController.sink;

  SayacBloc(){
    _sayacEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(SayacEvent event) {
    if(event is ArttirmaEvent){
      _sayac++;
    }else if(event is AzaltmaEvent){
      _sayac--;
    }
    _sayacStateSink.add(_sayac);
  }
}