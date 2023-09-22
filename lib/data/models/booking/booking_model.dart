import 'package:taxi_app/data/models/booking/booking_status.dart';
import 'package:taxi_app/data/models/payment/payment_model.dart';

class BookingModel {
  final String avatar;
  final String driverName;
  final String carName;
  final String carNumber;
  final BookingStatus status;
  final double distance;
  final int duration;
  final PaymentModel payment;
  final String date;
  final String currentLocTitle;
  final String currentLocStreet;
  final String arrivingLocTitle;
  final String arrivingLocStreet;

  BookingModel({
    required this.avatar,
    required this.driverName,
    required this.carName,
    required this.carNumber,
    required this.status,
    required this.distance,
    required this.duration,
    required this.payment,
    required this.date,
    required this.currentLocTitle,
    required this.currentLocStreet,
    required this.arrivingLocTitle,
    required this.arrivingLocStreet,
  });

  BookingModel copyWith(
    String? avatar,
    String? driverName,
    String? carName,
    String? carNumber,
    BookingStatus? status,
    double? distance,
    int? duration,
    PaymentModel? payment,
    String? date,
    String? currentLocTitle,
    String? currentLocStreet,
    String? arrivingLocTitle,
    String? arrivingLocStreet,
  ) {
    return BookingModel(
      avatar: avatar ?? this.avatar,
      driverName: driverName ?? this.driverName,
      carName: carName ?? this.carName,
      carNumber: carNumber ?? this.carNumber,
      status: status ?? this.status,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      payment: payment ?? this.payment,
      date: date ?? this.date,
      currentLocTitle: currentLocTitle ?? this.currentLocTitle,
      currentLocStreet: currentLocStreet ?? this.arrivingLocStreet,
      arrivingLocTitle: arrivingLocTitle ?? this.arrivingLocTitle,
      arrivingLocStreet: arrivingLocStreet ?? this.arrivingLocStreet,
    );
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      avatar: json["avatar"] ?? "",
      driverName: json["driverName"] ?? "",
      carName: json["carName"] ?? "",
      carNumber: json["carNumber"] ?? "",
      status: json["status"] ?? BookingStatus.active,
      distance: json["distance"] ?? 0.0,
      duration: json["duration"] ?? 0,
      payment: json["payment"] ??
          PaymentModel(
            paymentIcon: "",
            title: "",
            price: 0,
          ),
      date: json["date"] ?? "",
      currentLocTitle: json["currentLocTitle"] ?? "",
      currentLocStreet: json["currentLocStreet"] ?? "",
      arrivingLocTitle: json["arrivingLocTitle"] ?? "",
      arrivingLocStreet: json["arrivingLocStreet"] ?? "",
    );
  }
}
