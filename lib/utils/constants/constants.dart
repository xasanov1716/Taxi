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