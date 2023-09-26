import 'package:taxi_app/data/models/db/driver_model.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';

const baseUrl = "https://geocode-maps.yandex.ru";
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
  passangerType: "passangerType",
  price: 0,
  hasDelivery: true,
  hasRoofTop: true,
  isOnline: true,
  lastOnlineTime: "lastOnlineTime",
  longitude: 0.0,
  latitide: 0.0,
  hasFilled: true,
  carNumber: "carNumber",
);


