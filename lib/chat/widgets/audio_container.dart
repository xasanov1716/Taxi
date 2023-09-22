import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/colors/app_colors.dart';

class AudioContainer extends StatefulWidget {
  const AudioContainer({super.key, required this.audioPath});
  final String audioPath;

  @override
  State<AudioContainer> createState() => _AudioContainerState();
}

class _AudioContainerState extends State<AudioContainer> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration currentDuration = Duration.zero;

  _init() async {
    if (widget.audioPath.isNotEmpty) {
      await player.setSourceUrl(widget.audioPath);
    }
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = Duration.zero;
        currentDuration = Duration.zero;
      });
      // print("SONG COMPLETED");
    });

    player.onPositionChanged.listen((Duration d) {
      currentDuration = d;
      setState(() {});
      print("DURATION: ${d.inSeconds}");
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      color: AppColors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (!isPlaying) {
                      player.play(DeviceFileSource(widget.audioPath));
                      isPlaying = true;
                    } else {
                      player.pause();
                      isPlaying = false;
                    }
                  });
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                ),
              ),
              Slider(
                thumbColor: Colors.red, inactiveColor: AppColors.c_200,
                activeColor: AppColors.green,
                value: currentDuration.inSeconds.toDouble(),
                max: duration.inSeconds.toDouble(),
                // divisions: 100,
                //label: _currentSliderValue.round().toString(),
                onChanged: (double value) async {
                  print(value);
                  await player.seek(Duration(seconds: value.toInt()));
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("Max Duration: ${duration.inSeconds.toString()}"),
              Text("Current Duration: ${currentDuration.inSeconds.toString()}"),
            ],
          ),
        ],
      ),
    );
  }
}
