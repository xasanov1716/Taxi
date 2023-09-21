part of 'create_order_bloc.dart';
class CreateOrderState extends Equatable {
  final List<String> promoCodeList;
  final FormStatus status;

  const CreateOrderState({required this.promoCodeList, required this.status});

  @override
  List<Object?> get props => [status, promoCodeList];

  CreateOrderState copyWith({
    List<String>? promoCodeList,
    FormStatus? status,
  }) {
    return CreateOrderState(
      promoCodeList: promoCodeList ?? this.promoCodeList,
      status: status ?? this.status,
    );
  }
}
