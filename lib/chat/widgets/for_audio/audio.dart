// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:taxi_app/chat/widgets/for_audio/audio_bloc.dart';

class VoiceChat extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> data;
  const VoiceChat({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _VoiceChatState createState() => _VoiceChatState();
}

class _VoiceChatState extends State<VoiceChat> {
  TextEditingController messageController = TextEditingController();




  // void readLocal() async {
    // var a = await FirebaseFirestore.instance.collection('chat').get();
    // setState(() {
    //   currentUserId = widget.data.id == "AwCh9AOfdnMgK8gJZnOL"
    //       ? a.docs[0].id
    //       : a.docs[1].id;
    // });
    // String peerId =
    // widget.data.id != "AwCh9AOfdnMgK8gJZnOL" ? a.docs[0].id : a.docs[1].id;
  //   if (currentUserId.compareTo(peerId) > 0) {
  //     groupChatId = '$currentUserId-$peerId';
  //   } else {
  //     groupChatId = '$peerId-$currentUserId';
  //   }
  //   chatProvider.updateDataFirestore(
  //     'chat',
  //     currentUserId,
  //     {'chattingWith': peerId},
  //   );
  // }

  // void onSendMessage(String content, int type, {String? duration = ""}) {
  //   if (content.trim().isNotEmpty) {
  //     messageController.clear();
  //     chatProvider.sendMessage(
  //         content, type, groupChatId, currentUserId, widget.data.id.toString(),
  //         duration: duration!);
  //     _scrollController.animateTo(0,
  //         duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: 'Nothing to send', backgroundColor: Colors.grey);
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  // _scrollListener() {
  //   if (_scrollController.offset >=
  //       _scrollController.position.maxScrollExtent &&
  //       !_scrollController.position.outOfRange &&
  //       _limit <= listMessage.length) {
  //     setState(() {
  //       _limit += _limitIncrement;
  //     });
  //   }
  // }

  // void onFocusChange() {
  //   if (focusNode.hasFocus) {
  //     // Hide sticker when keyboard appear
  //     setState(() {
  //       isShowSticker = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {


    bool temp = false;
    bool audio = false;
    int _limit = 20;
    int _limitIncrement = 20;
    List<QueryDocumentSnapshot> listMessage = [];

    Stream<QuerySnapshot>? chatMessageStream;
    final ScrollController _scrollController = ScrollController();
    String groupChatId = "";
    bool isShowSticker = false;
    final FocusNode focusNode = FocusNode();
    String currentUserId = "";

    AudioController audioController = context.read<AudioBloc>();
    AudioPlayer audioPlayer = AudioPlayer();
    String audioURL = "";
    Future<bool> checkPermission() async {
      if (!await Permission.microphone.isGranted) {
        PermissionStatus status = await Permission.microphone.request();
        if (status != PermissionStatus.granted) {
          return false;
        }
      }
      return true;
    }

    void startRecord() async {
      bool hasPermission = await checkPermission();
      if (hasPermission) {
        recordFilePath = await getFilePath();
        RecordMp3.instance.start(recordFilePath, (type) {
          setState(() {});
        });
      } else {}
      setState(() {});
    }

    void stopRecord() async {
      bool stop = RecordMp3.instance.stop();
      audioController.end.value = DateTime.now();
      audioController.calcDuration();
      var ap = AudioPlayer();
      await ap.play(AssetSource("Notification.mp3"));
      ap.onPlayerComplete.listen((a) {});
      if (stop) {
        audioController.isRecording.value = false;
        audioController.isSending.value = true;
      }
    }

    int i = 0;

    Future<String> getFilePath() async {
      Directory storageDirectory = await getApplicationDocumentsDirectory();
      String sdPath =
          "${storageDirectory.path}/record${DateTime.now().microsecondsSinceEpoch}.acc";
      var d = Directory(sdPath);
      if (!d.existsSync()) {
        d.createSync(recursive: true);
      }
      return "$sdPath/test_${i++}.mp3";
    }

    late String recordFilePath;
    return SizedBox();
  }

  // Future uploadFile() async {
  //   UploadTask uploadTask = chatProvider.uploadFile(imageFile!,
  //       "image/${DateTime.now().millisecondsSinceEpoch.toString()}");
  //   try {
  //     TaskSnapshot snapshot = await uploadTask;
  //     imageUrl = await snapshot.ref.getDownloadURL();
  //     setState(() {
  //       isLoading = false;
  //
  //     });
  //   } on FirebaseException catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Fluttertoast.showToast(msg: e.message ?? e.toString());
  //   }
  // }




  // Widget _audio({
  //   required String message,
  //   required bool isCurrentUser,
  //   required int index,
  //   required String time,
  //   required String duration,
  // }) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.5,
  //     padding: EdgeInsets.all(8),
  //     decoration: BoxDecoration(
  //       color: isCurrentUser ? mainColor : mainColor.withOpacity(0.18),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Row(
  //       children: [
  //         GestureDetector(
  //           onTap: () {
  //             audioController.onPressedPlayButton(index, message);
  //             // changeProg(duration: duration);
  //           },
  //           onSecondaryTap: () {
  //             audioPlayer.stop();
  //             //   audioController.completedPercentage.value = 0.0;
  //           },
  //           child: Obx(
  //                 () => (audioController.isRecordPlaying &&
  //                 audioController.currentId == index)
  //                 ? Icon(
  //               Icons.cancel,
  //               color: isCurrentUser ? Colors.white : mainColor,
  //             )
  //                 : Icon(
  //               Icons.play_arrow,
  //               color: isCurrentUser ? Colors.white : mainColor,
  //             ),
  //           ),
  //         ),
  //         Obx(
  //               () => Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 0),
  //               child: Stack(
  //                 clipBehavior: Clip.none,
  //                 alignment: Alignment.center,
  //                 children: [
  //                   // Text(audioController.completedPercentage.value.toString(),style: TextStyle(color: Colors.white),),
  //                   LinearProgressIndicator(
  //                     minHeight: 5,
  //                     backgroundColor: Colors.grey,
  //                     valueColor: AlwaysStoppedAnimation<Color>(
  //                       isCurrentUser ? Colors.white : mainColor,
  //                     ),
  //                     value: (audioController.isRecordPlaying &&
  //                         audioController.currentId == index)
  //                         ? audioController.completedPercentage.value
  //                         : audioController.totalDuration.value.toDouble(),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Text(
  //           duration,
  //           style: TextStyle(
  //               fontSize: 12, color: isCurrentUser ? Colors.white : mainColor),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
