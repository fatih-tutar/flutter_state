import 'package:bloc/bloc.dart';
import 'package:flutterstate/bloc_paket/sayi_event.dart';
import 'package:flutterstate/bloc_paket/sayi_state.dart';

class SayiBloc extends Bloc<SayiEvent, SayiState>{
  @override
  SayiState get initialState => SayiState.initial();

  @override
  Stream<SayiState> mapEventToState(SayiEvent event) async* {

    final _currentState = state;

    if(event is SayiArttirEvent){

      yield SayiState(sayi : _currentState.sayi+1);

    }else if(event is SayiAzaltEvent){

      yield SayiState(sayi : _currentState.sayi-1);

    }
  }
  void onArttir(){
    add(SayiArttirEvent());
  }
  void onAzalt(){
    add(SayiAzaltEvent());
  }
}