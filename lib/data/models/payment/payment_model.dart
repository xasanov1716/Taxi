import 'package:taxi_app/utils/icons/app_icons.dart';

class PaymentModel{
  final String paymentIcon;
  final String title;
  final num price;


  PaymentModel({
    required this.paymentIcon,
    required this.title,
    required this.price
});

  factory PaymentModel.fromJson(Map<String, dynamic> json){
    return PaymentModel(paymentIcon: json["paymentIcon"], title: json["title"], price: json["price"]);
  }
}

List<PaymentModel> payments = [
  PaymentModel(paymentIcon: AppIcons.myWallet, title: "My Wallet", price: 957.50),
  PaymentModel(paymentIcon: AppIcons.payPal, title: "PayPal", price: 0),
  PaymentModel(paymentIcon: AppIcons.googlePay, title: "Google Pay", price: 0),
  PaymentModel(paymentIcon: AppIcons.applePay, title: "Apple Pay", price: 0),
  PaymentModel(paymentIcon: AppIcons.masterCard, title: ".... .... .... 4679", price: 0),
  PaymentModel(paymentIcon: AppIcons.cashMoney, title: "Cash Money", price: 0)
];