import 'package:taxi_app/data/models/driver/driver_model.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

const baseUrl = "https://geocode-maps.yandex.ru";
const notificationUrl = "https://fcm.googleapis.com/fcm/send";
const String apiKey = "0966317a-0c56-4ae7-a7ee-eda74212af4d";

List<String> notificationKeys = [
  StorageKeys.generalNotifications,
  StorageKeys.soundNotifications,
  StorageKeys.vibrateNotifications,
  StorageKeys.specialOffersNotifications,
  StorageKeys.promoDiscountNotifications,
  StorageKeys.paymentsNotifications,
  StorageKeys.cashbackNotifications,
  StorageKeys.appUpdatesNotifications,
  StorageKeys.newServiceAvailableNotifications,
  StorageKeys.newTipsAvailableNotifications,
];
List<bool> notificationValues = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
List<String> securityKeys = [
  StorageKeys.rememberMeSecurity,
  StorageKeys.faceIdMeSecurity,
  StorageKeys.biometricIdMeSecurity,
];
List<bool> securityValues = [
  false,
  false,
  false,
];

DriverModel driverModel = DriverModel(
    driverId: "driverId",
    fcmToken: "fcmToken",
    fullName: "fullName",
    createdAt: "createdAt",
    birthDate: "birthDate",
    phoneNumber: "phoneNumber",
    telegramLink: "telegramLink",
    email: "email",
    gender: "gender",
    imageUrl: "imageUrl",
    currentLocation: "currentLocation",
    fromToText: "fromToText",
    from: 0,
    to: 0,
    emptyPlaces: 0,
    aboutDriver: "aboutDriver",
    carModel: "carModel",
    passengerType: "passengerType",
    price: 0,
    hasDelivery: true,
    hasRoofTop: true,
    isOnline: true,
    lastOnlineTime: "lastOnlineTime",
    longitude: 0.0,
    latitude: 0.0,
    hasFilled: true,
    carNumber: "carNumber",
    role: 'role');

class FirebaseCollections {
  static const String addresses = "addresses";
  static const String orders = "orders";
  static const String drivers = "drivers";
  static const String users = "clients";
  static const String requestDriver = 'requestDriver';
  static const String requestClient = 'requestClient';
}

Map<String, String> iconMapping = {
  "discount" : AppIcons.discount,
  "wallet"   : AppIcons.wallet,
  "location" : AppIcons.location,
  "money"   : AppIcons.money,
  "card"    : AppIcons.card,
  "profile" : AppIcons.profile,
};
