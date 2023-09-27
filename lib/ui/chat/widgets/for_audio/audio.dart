
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:taxi_app/blocs/messages/message_bloc.dart';
import 'package:taxi_app/blocs/messages/message_event.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/message/message_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class AudioController extends StatefulWidget {
  const AudioController({Key? key}) : super(key: key);

  @override
  State<AudioController> createState() => _AudioControllerState();
}

class _AudioControllerState extends State<AudioController> {
  String recordMp3 = "";
  bool isRecording = false;
  String mp3FilePath = "";
  AudioPlayer audioPlayer = AudioPlayer();
  bool showTimerPopup = false;

  Timer? timer;
  Duration recordingDuration = const Duration(seconds: 0);

  void initAudioPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    print(appDocDir);
    mp3FilePath = "${appDocDir.path}/a.mp3";
  }

  @override
  void initState() {
    initAudioPath();
    _checkPermission();
    super.initState();
  }

  Future<void> _checkPermission() async {
    final status = await Permission.microphone.status;
    if (status.isDenied) {
      await Permission.storage.request();
      await Permission.microphone.request();
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Handle the case when permission is denied
    }
  }

  void startRecording() async {
    if (!isRecording) {
      // await recordMp3.start(mp3FilePath, (path) {
      //   print("Error");
      // });
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          recordingDuration = recordingDuration + const Duration(seconds: 1);
        });
      });
      setState(() {
        isRecording = true;
      });
    }
  }

  void stopRecording() async {
    if (isRecording) {
      //await recordMp3.stop();
      if (timer != null && timer!.isActive) {
        timer!.cancel();
      }
      setState(() {
        isRecording = false;
      });
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onLongPress: () {
            startRecording();
            setState(() {
              showTimerPopup = true;
            });
          },
          onLongPressEnd: (details) {
            stopRecording();
            context.read<MessageBloc>().add(SendMessage(
                messageModel: MessageModel(
                    receiverName: 'sad',
                    senderName: 'asf',
                    dateTime: DateTime.now().toString(),
                    voice: mp3FilePath)));
            setState(() {
              showTimerPopup = false;
            });
            recordingDuration = const Duration(seconds: 0);
          },
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              gradient: AppColors.gradientOrangeYellow,
            ),
            child: SvgPicture.asset(AppIcons.getSvg(
                name: isRecording ? AppIcons.closeSquare : AppIcons.voice,
                iconType: IconType.bold)),
          ),
        ),

        // Positioned(
        //   top: -15,
        //   child: Text(
        //     recordingDuration.inSeconds.toString() + 's',
        //     style: TextStyle(fontSize: 18),
        //   ),),
      ],
    );
  }
}
