import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/widgets/date_formatter.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

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
      debugPrint("DURATION: ${d.inSeconds}");
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
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  size: 24.w,
                ),
              ),
              Slider(
                thumbColor: Colors.red, inactiveColor: AppColors.c_200,
                activeColor: AppColors.green,
                value: currentDuration.inSeconds.toDouble(),
                max: duration.inSeconds.toDouble(),
                divisions: 100,
                //label: _currentSliderValue.round().toString(),
                onChanged: (double value) async {
                  await player.seek(Duration(seconds: value.toInt()));
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("${formatSeconds(currentDuration.inSeconds)} | "),
              Text(formatSeconds(duration.inSeconds)),
            ],
          ),
          4.ph,
        ],
      ),
    );
  }
}
