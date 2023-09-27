import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/data/models/status/form_status.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  CreateOrderBloc() : super(const CreateOrderState(promoCodeList: [], status: FormStatus.pure)) {
    on<UpdatePromoCodes>(_updatePromoCode);
    on<ClearPromoCodes>(_clearPromoCodes);
  }
  List<String> xList = [];
  _updatePromoCode(UpdatePromoCodes event, Emitter<CreateOrderState> emit) {
    emit(state.copyWith(status: FormStatus.loading));

    if (event.promoCode.isNotEmpty) {
      xList.add(event.promoCode);
      print(xList);
      emit(state.copyWith(promoCodeList: xList, status: FormStatus.success));
    }
  }

  _clearPromoCodes(ClearPromoCodes event, Emitter<CreateOrderState> emit) {
    emit(state.copyWith(status: FormStatus.loading));
    if (state.promoCodeList.isNotEmpty) {
      xList.remove(event.index);
      emit(state.copyWith(promoCodeList: xList, status: FormStatus.success));
    }
  }
}
