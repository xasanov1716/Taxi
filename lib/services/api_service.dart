import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/data/models/result_model.dart';
import '../data/models/address/geocoding/geocoding.dart';
import '../data/models/universal_data.dart';
import '../utils/constants/constants.dart';

class ApiService {
  // DIO SETTINGS

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": apiKey,
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );

  ApiService() {
    _init();
  }

  _init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          //error.response.statusCode
          debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV  YUBORILDI :${handler.isCompleted}");
          // return handler.resolve(Response(requestOptions: requestOptions, data: {"name": "ali", "age": 26}));
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB  KELDI :${handler.isCompleted}");
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getAddress({
    required LatLng latLng,
    required String kind,
    required String lang,
  }) async {
    Response response;
    try {
      response = await dio.get(
        '/1.x/',
        queryParameters: {
          "apikey": apiKey,
          "geocode": "${latLng.longitude}, ${latLng.latitude}",
          "lang": lang,
          "format": "json",
          "kind": kind,
          "rspn": "1",
          "results": "1",
        },
      );

      if (response.statusCode == 200) {
        String text = 'Aniqlanmagan Hudud';
        Geocoding geocoding = Geocoding.fromJson(response.data);
        if (geocoding.response.geoObjectCollection.featureMember.isNotEmpty) {
          text = geocoding.response.geoObjectCollection.featureMember[0].geoObject.metaDataProperty
              .geocoderMetaData.text;
        }
        return UniversalData(data: text);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<Result> sendNotification({
    required NotificationModel notification,
    String topic = 'news',
  }) async {
    try {
      final response = await dio.post(notificationUrl,
          options: Options(headers: {"Authorization": firebaseApiKey}),
          data: {
            "to": "/topics/news",
            "notification": {
              "body": "This is a Firebase Cloud Messaging Topic Test Message!",
              "title": "Test Notification"
            },
            "data": {"title": "test Title", "body": "test Body", "iconCode": "wallet"}
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('ok');
        return Result.success(null);
      }
      print([response.data]);
      return Result.fail(response.data);
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}
