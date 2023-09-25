import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class AudioBloc {
  final AudioPlayerService _audioPlayerService = AudioPlayerAdapter();
  late final AudioPlayer _audioPlayer;
  late StreamController<bool> _isRecordPlayingController;
  late Stream<bool> isRecordPlayingStream;
  late StreamController<int> _currentIdController;
  late Stream<int> currentIdStream;
  late StreamController<int> _currentDurationController;
  late Stream<int> currentDurationStream;
  late StreamController<int> _totalDurationController;
  late Stream<int> totalDurationStream;
  late StreamController<double> _completedPercentageController;
  late Stream<double> completedPercentageStream;

  AudioBloc() {
    _audioPlayer = _audioPlayerService.getAudioPlayer;
    _isRecordPlayingController = StreamController<bool>.broadcast();
    isRecordPlayingStream = _isRecordPlayingController.stream;
    _currentIdController = StreamController<int>.broadcast();
    currentIdStream = _currentIdController.stream;
    _currentDurationController = StreamController<int>.broadcast();
    currentDurationStream = _currentDurationController.stream;
    _totalDurationController = StreamController<int>.broadcast();
    totalDurationStream = _totalDurationController.stream;
    _completedPercentageController = StreamController<double>.broadcast();
    completedPercentageStream = _completedPercentageController.stream;

    _audioPlayer.onDurationChanged.listen((duration) {
      _totalDurationController.sink.add(duration.inMicroseconds);
    });



    _audioPlayer.onPlayerComplete.listen((event) async {
      await _audioPlayer.seek(Duration.zero);
      _isRecordPlayingController.sink.add(false);
    });
  }

  void dispose() {
    _isRecordPlayingController.close();
    _currentIdController.close();
    _currentDurationController.close();
    _totalDurationController.close();
    _completedPercentageController.close();
  }

  void onPressedPlayButton(int id, String content) async {
    _currentIdController.sink.add(id);

    _isRecordPlayingController.sink.add(true);
    await _audioPlayerService.play(content);
  }

  Future<void> _pauseRecord() async {
    _isRecordPlayingController.sink.add(false);
    await _audioPlayerService.pause();
  }
}

abstract class AudioPlayerService {
  AudioPlayer get getAudioPlayer;
  Future<void> dispose();
  Future<void> play(String url);
  Future<void> resume();
  Future<void> pause();
  Future<void> release();
}

class AudioPlayerAdapter implements AudioPlayerService {
  late AudioPlayer _audioPlayer;

  @override
  AudioPlayer get getAudioPlayer => _audioPlayer;

  AudioPlayerAdapter() {
    _audioPlayer = AudioPlayer();
  }

  @override
  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }

  @override
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  @override
  Future<void> play(String url) async {
    await _audioPlayer.play(UrlSource(url));
  }

  @override
  Future<void> release() async {
    await _audioPlayer.release();
  }

  @override
  Future<void> resume() async {
    await _audioPlayer.resume();
  }
}
