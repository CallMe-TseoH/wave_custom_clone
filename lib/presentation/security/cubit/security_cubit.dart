import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wave_custom_clone/core/enums/enums.dart';

part 'security_state.dart';

class SecurityCubit extends Cubit<SecurityState> {
  SecurityCubit() : super(const SecurityState());

  void onTapNumber(int value){
    if(value==12){
      if(state.pin.isNotEmpty){
        final _lastPinValue = state.pin.substring(0, state.pin.length-1);
        emit(state.copyWith(pin: _lastPinValue));
      }
    }else{
      if(state.pin.length==4) return;
      final _lastPinValue = state.pin+value.toString();
      emit(state.copyWith(pin: _lastPinValue));
    }

  }
}
