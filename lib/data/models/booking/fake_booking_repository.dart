import 'package:taxi_app/data/models/booking/booking_status.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/payment/payment_model.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

import 'package:taxi_app/data/models/booking/booking_model.dart';

List<BookingModel> fakeBookings = [
  BookingModel(
      avatar: AppIcons.drFake1,
      driverName: "Daniel Austin",
      carName: "Mercedes-Benz E-Cl..",
      carNumber: "HSW 4736 XK",
      status: BookingStatus.active,
      distance: 4.5,
      duration: 4,
      payment: PaymentModel(
          paymentIcon: AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
          title: "USD",
          price: 7.00),
      date: "Dec 20, 2024 | 10:00 AM",
      currentLocTitle: "Current Location",
      currentLocStreet: "35 Oak Ave. Antioch, TN 37013",
      arrivingLocTitle: "Soft Bank Buildings",
      arrivingLocStreet: "26 State St. Daphne, AL 36526"),
  BookingModel(
      avatar: AppIcons.drFake2,
      driverName: "Wade Warren",
      carName: "Honda Mobilio",
      carNumber: "HDG 6374 SY",
      status: BookingStatus.completed,
      distance: 6.4,
      duration: 14,
      payment: PaymentModel(
          paymentIcon: AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
          title: "USD",
          price: 24.00),
      date: "Dec 18, 2024 | 14:27 PM",
      currentLocTitle: "National Grand Park",
      currentLocStreet: "6 Glendale St. Worcester, MA 01604",
      arrivingLocTitle: "Fitness Center",
      arrivingLocStreet: "83 Cypress Street Longwood, FL 32779"),
  BookingModel(
      avatar: AppIcons.drFake3,
      driverName: "Jane Cooper",
      carName: "Toyota Vios Limo",
      carNumber: "HDY 291F GR",
      status: BookingStatus.completed,
      distance: 9.7,
      duration: 16,
      payment: PaymentModel(
          paymentIcon: AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
          title: "USD",
          price: 18.00),
      date: "Dec 24, 2024 | 16:00 AM",
      currentLocTitle: "National Grand Park",
      currentLocStreet: "35 Oak Ave. Antioch, TN 37013",
      arrivingLocTitle: "Soft Bank Buildings",
      arrivingLocStreet: "26 State St. Daphne, AL 36526"),
  BookingModel(
      avatar: AppIcons.drFake4,
      driverName: "Albert Flores",
      carName: "Toyota Alphard",
      carNumber: "HAY 2743 FK",
      status: BookingStatus.cancelled,
      distance: 5.7,
      duration: 12,
      payment: PaymentModel(
          paymentIcon: AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
          title: "USD",
          price: 20.00),
      date: "Dec 15, 2024 | 16:48 PM",
      currentLocTitle: "Town Square",
      currentLocStreet: "86 N. Ohio Court Norfolk, VA 23503",
      arrivingLocTitle: "Grand Mall Plaza",
      arrivingLocStreet: "9037 Spruce Avenue Nutley, NJ 07110"),
  BookingModel(
      avatar: AppIcons.drFake5,
      driverName: "Daniel Austin",
      carName: "Mercedes-Benz E-Cl..",
      carNumber: "HSW 4736 XK",
      status: BookingStatus.cancelled,
      distance: 4.5,
      duration: 4,
      payment: PaymentModel(
          paymentIcon: AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
          title: "USD",
          price: 7.00),
      date: "Dec 20, 2024 | 10:00 AM",
      currentLocTitle: "Current Location",
      currentLocStreet: "35 Oak Ave. Antioch, TN 37013",
      arrivingLocTitle: "Soft Bank Buildings",
      arrivingLocStreet: "26 State St. Daphne, AL 36526"),
];
